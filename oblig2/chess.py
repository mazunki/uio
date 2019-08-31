"""
  This program is made as a solution to activity 5 of the 2nd assignment of
  IN1000 at UiO, fall 2019.

  The proposed idea is to input a chess scenario, either as an absolute matrix,
  or by giving the set of movements according to FIDE's standard algebraic notation.
  Check Appendix C at https://www.fide.com/fide/handbook.html?id=171&view=article

  The output will be a list of movements possible to do checkmate. None if there is no
  immediate checkmate.
"""

# Language holders
KING = "King"
QUEEN = "Queen"
ROOK = "Rook"
BISHOP = "Bishop"
KNIGHT = "Knight"
PAWN = "Pawn"
COLOURS = WHITE, BLACK = "White", "Black"
# Board values
SIZE = SIZE_X, SIZE_Y = 8, 8
translate_symbol = {KING: "K", QUEEN: "Q", ROOK: "R", BISHOP: "B", KNIGHT: "N", PAWN: "P"}
# Relative coordinates
UP, DOWN = 1, -1
LEFT, RIGHT = 1, -1
DIRECTIONS = NORTH, SOUTH, WEST, EAST = N,S,W,E = "N", "S", "W", "E"
NW, NE, SW, SE = N+W, N+E, S+W, S+E
SPRINT = "*"

# Helper rows
FRONT_ROW = {WHITE: "2", BLACK: "7"}
BACK_ROW = {WHITE: "1", BLACK: "8"}

# algebraic => matrix
translate_x = {"a": 0,	"b": 1,		"c": 2,		"d": 3,		"e": 4,		"f": 5,		"g": 6,		"h": 7}
translate_y = {"8": 0,	"7": 1,		"6": 2,		"5": 3,		"4": 4,		"3": 5,		"2": 6,		"1": 7}



##########################
#  Definition of pieces  #
##########################

class Piece:
	def __init__(self, game, figure, colour, position):
		self.game = game

		self.figure = figure
		self.colour = colour
		self.position = position if isinstance(position, Coordinate) else Coordinate(position)

	def __str__(self):
		return f"{self.colour} {self.figure} @ {self.position}"

	def __setattr__(self, name, value):
		self.__dict__[name] = value
		if name == "position":
			# TODO: update alg_x, alg_y
			if self.position.x is not None and self.position.y is not None:
				self.game[self.position.y][self.position.x] = translate_symbol[self.figure]

	def get_moves(self):
		return self.position.filter(self.moves)


class King(Piece):
	moves = [N, S, W, E, NW, NE, SW, SE]
	def __init__(self, game, colour, position=None):
		if not position:
			if colour == WHITE:
				position = Coordinate("e1")  # 4, 7
			elif colour == BLACK:
				position = Coordinate.fromTuple(4, 0)  # e8

		super().__init__(game=game, figure=KING, colour=colour, position=position)
		self.moves = King.moves

class Queen(Piece):
	moves = [SPRINT+direction for direction in [N, S, W, E, NW, NE, SW, SE]]
	def __init__(self, game, colour, position=None):
		if not position:
			if colour == WHITE:
				position = Coordinate("d1")
			elif colour == BLACK:
				position = Coordinate("d8")

		super().__init__(game=game, figure=QUEEN, colour=colour, position=position)


class Rook(Piece):
	def __init__(self, game, colour, position):
		super().__init__(game=game, figure=ROOK, colour=colour, position=position)
		self.index = self.position.x

	@staticmethod
	def rook_starts(colour):
		return [y+BACK_ROW[colour] for y in list("ah")]


class Bishop(Piece):
	def __init__(self, game, colour, position):
		super().__init__(game=game, figure=BISHOP, colour=colour, position=position)
		self.index = self.position.x

	@staticmethod
	def bishop_starts(colour):
		return [y+BACK_ROW[colour] for y in list("cf")]


class Knight(Piece):
	def __init__(self, game, colour, position):
		super().__init__(game=game, figure=KNIGHT, colour=colour, position=position)
		self.index = self.position.x

	@staticmethod
	def knight_starts(colour):
		return [y+BACK_ROW[colour] for y in list("bg")]


class Pawn(Piece):
	def __init__(self, game, colour, position):
		super().__init__(game=game, figure=PAWN, colour=colour, position=position)
		self.index = self.position.x

	@staticmethod
	def pawn_starts(colour):
		return [y+FRONT_ROW[colour] for y in list("abcdefgh")]


################
#  Board setup #
################

class Board:
	def __init__(self):
		self.game = [[" " for _ in range(SIZE_X)] for _ in range(SIZE_Y)]

	def __str__(self):
		fmt = "|".join('{{:{}}}'.format(x) for x in [1]*8)
		table = [fmt.format(*row) for row in self.game]

		return "\n|"+"|\n|".join(table) + "|\n\n"

	def __getitem__(self, i):
		return self.game[i]


class Coordinate:
	def __init__(self, algebraic):
		"""
			TODO: Check the order of values. Swap them if necessary. Input could be in `yx` format.
		"""
		self.alg_x = algebraic[0]
		self.alg_y = algebraic[1]

		self.x, self.y = None, None

		self.x, self.y = self.get_tuple(self.alg_x, self.alg_y)
		self.tuple = self.x, self.y

	@classmethod
	def fromTuple(cls, x, y):
		"""
			TODO: If keys are not found, try swapping them. Maybe the input is in an `(y,x)` format.
		"""
		alg_x = None
		alg_y = None

		for key, value in translate_x.items():
			if value == x:
				alg_x = key
		for key, value in translate_y.items():
			if value == y:
				alg_y = key

		try:
			assert alg_x, f"x:{x}"
			assert alg_y, f"y:{y}"
		except AssertionError as error:
			print(f"{error} failed to be found in translation map.")
			raise

		return cls(f"{alg_x}{alg_y}")

	@classmethod
	def fromAlgebraic(cls, algebraic):
		return cls(algebraic)

	def filter(self, moves):
		actual_moves = list()  # doesn't consider other pieces blocking way

		for move in moves:

			sprinter = move[0] == "*"
			if sprinter:
				move = move[1:]

			rel_x, rel_y =  0, 0
			for step in move:
				if step == "N":
					rel_y += UP
				elif step == "S":
					rel_y += DOWN

				elif step == "W":
					rel_x += LEFT
				elif step == "E":
					rel_x += RIGHT

			if sprinter:
				step = 1
				while (0 <= self.x + rel_x*step < SIZE_X) and (0 <= self.y + rel_y*step < SIZE_Y):
					actual_moves.append(move*step)
					step += 1
			else:			
				if 0 <= self.x + rel_x < SIZE_X:
					if 0 <= self.y + rel_y < SIZE_Y:
						actual_moves.append(move)

		print(f"{self} moves: {actual_moves}")

	@staticmethod
	def get_tuple(alg_x_, alg_y_):
		try:
			assert alg_x_ in translate_x.keys(), f"x:{alg_x_}"
			assert alg_y_ in translate_y.keys(), f"y:{alg_y_}"
		except AssertionError as error:
			print(f"{error} failed to be found in translation map.")
			raise

		return translate_x[alg_x_], translate_y[alg_y_]

	def algebraic_format(self):
		return f"{self.alg_x}{self.alg_y}"

	def __str__(self):
		return self.algebraic_format()

	def __repr__(self):
		return str(self.get_tuple(self.alg_x, self.alg_y))


#######################
# Standard game setup #
#######################

game = Board()
figurines = dict()

for colour in [WHITE, BLACK]:
	king = King(game, colour)
	queen = Queen(game, colour)

	my_rooks = list()
	for rook_pos in Rook.rook_starts(colour):
		new_rook = Rook(game, colour, rook_pos)
		my_rooks.append(new_rook)

	my_bishops = list()
	for bishop_pos in Bishop.bishop_starts(colour):
		new_bishop = Bishop(game, colour, bishop_pos)
		my_bishops.append(new_bishop)

	my_knights = list()
	for knight_pos in Knight.knight_starts(colour):
		new_knight = Knight(game, colour, knight_pos)
		my_knights.append(new_knight)

	my_pawns = list()
	for pawn_pos in Pawn.pawn_starts(colour):
		new_pawn = Pawn(game, colour, pawn_pos)
		my_pawns.append(new_pawn)

	figurines[colour] = {KING:king, QUEEN:queen, PAWN:my_pawns, ROOK:my_rooks, BISHOP:my_bishops, KNIGHT:my_knights}

	queen.get_moves()

print(game)

for colour in COLOURS:
	print(colour)
	for figure_type, pieces in figurines[colour].items():
		print("\t", figure_type)
		
		try:
			for piece in pieces:
				print("\t\t", piece)
		except:
			print("\t\t", pieces)
