"""
  This program is made as a solution to activity 5 of the 2nd assignment of
  IN1000 at UiO, fall 2019.

  The proposed idea is to input a chess scenario, either as an absolute matrix,
  or by giving the set of movements according to FIDE's standard algebraic notation.
  Check Appendix C at https://www.fide.com/fide/handbook.html?id=171&view=article

  The output will be a list of movements possible for any piece. Takes into account
  checking, capturing and illegal moves.
  
"""

# Language holders
KING = "King"
QUEEN = "Queen"
ROOK = "Rook"
BISHOP = "Bishop"
KNIGHT = "Knight"
PAWN = "Pawn"
LAND = " "
COLOURS = WHITE, BLACK = "White", "Black"
# Board values
SIZE = SIZE_X, SIZE_Y = 8, 8
translate_symbol = {KING: "K", QUEEN: "Q", ROOK: "R", BISHOP: "B", KNIGHT: "N", PAWN: "P", LAND: "-"}  # for map
translate_algebra = {KING: "K", QUEEN: "Q", ROOK: "R", BISHOP: "B", KNIGHT: "N", PAWN: ""}  # per FIDE/mov notation
# Relative coordinates
UP, DOWN = -1, 1
LEFT, RIGHT = 1, -1
DIRECTIONS = NORTH, SOUTH, WEST, EAST = N,S,W,E = "N", "S", "W", "E"
NW, NE, SW, SE = N+W, N+E, S+W, S+E
SPRINT = "*"
CAPTURE = "x"
CHECCK = "#"

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

	def __repr__(self):
		return f"{self.colour} {self.figure} @ {self.position}"

	def __str__(self):
		return translate_symbol[self.figure]

	def __setattr__(self, name, value):
		self.__dict__[name] = value
		if name == "position":
			# TODO: update alg_x, alg_y
			if self.position.x is not None and self.position.y is not None:
				self.game[self.position.y][self.position.x] = self

	def get_moves(self):
		rel_destinations = self.position.filter(self.moves, self.capture_moves, game=self.game, colour=self.colour)
		coords = [str(self.position + dest) for dest in rel_destinations]
		notation_mov = [Coordinate.fromAlgebraic(target).algebraic_movement(self.figure) for target in coords]
		return notation_mov


class King(Piece):
	moves = [N, S, W, E, NW, NE, SW, SE]
	capture_moves = moves
	def __init__(self, game, colour, position=None):
		if not position:
			if colour == WHITE:
				position = Coordinate("e1")  # 4, 7
			elif colour == BLACK:
				position = Coordinate.fromTuple(4, 0)  # e8

		super().__init__(game=game, figure=KING, colour=colour, position=position)


class Queen(Piece):
	moves = [SPRINT+direction for direction in [N, S, W, E, NW, NE, SW, SE]]
	capture_moves = moves
	def __init__(self, game, colour, position=None):
		if not position:
			if colour == WHITE:
				position = Coordinate("d1")
			elif colour == BLACK:
				position = Coordinate("d8")

		super().__init__(game=game, figure=QUEEN, colour=colour, position=position)


class Rook(Piece):
	moves = [SPRINT+direction for direction in [N,S,W,E]]
	capture_moves = moves
	def __init__(self, game, colour, position):
		super().__init__(game=game, figure=ROOK, colour=colour, position=position)
		self.index = self.position.x

	@staticmethod
	def rook_starts(colour):
		return [y+BACK_ROW[colour] for y in list("ah")]


class Bishop(Piece):
	moves = [SPRINT+direction for direction in [NW, NE, SW, SE]]
	capture_moves = moves
	def __init__(self, game, colour, position):
		super().__init__(game=game, figure=BISHOP, colour=colour, position=position)
		self.index = self.position.x

	@staticmethod
	def bishop_starts(colour):
		return [y+BACK_ROW[colour] for y in list("cf")]


class Knight(Piece):
	moves = [2*N+W, 2*S+W, 2*N+E, 2*S+W, 2*W+N, 2*W+S, 2*E+N, 2*E+S]
	capture_moves = moves
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
		
		self.moves = [N] if self.colour == WHITE else [S]
		self.capture_moves = [NW, NE] if self.colour == WHITE else [SW, SE]

	@staticmethod
	def pawn_starts(colour):
		return [y+FRONT_ROW[colour] for y in list("abcdefgh")]



#################
#  Board setup  #
#################

class Board:
	def __init__(self):
		self.game = [[LAND for _ in range(SIZE_X)] for _ in range(SIZE_Y)]

	def __str__(self):
		width = 3

		clean_matrix = [[str(pos) for pos in row] for row in self.game]
		lineformat = f"|{{:^{width}}}"*8 + "|"
		table = [lineformat.format(*row) for row in clean_matrix]
		return f" {{:^{width}}}".format("_"*width)*8 + "\n"\
				+ "\n".join(table) + "\n"\
				+ f" {{:^{width}}}".format("‾"*width)*8

	def __repr__(self):
		return [col for col in row in self.game]

	def __getitem__(self, row):
		return self.game[row]


class Coordinate:
	"""
		TODO: Create abstract class where boundaries don't matter, for relative coordinates.
	"""
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

	@classmethod
	def fromRelative(cls, relation):
		rel_x = relation.count(W)*LEFT + relation.count(E)*RIGHT
		rel_y = relation.count(N)*UP + relation.count(S)*DOWN
		return (rel_x, rel_y)



	def filter(self, moves, capture_moves, game=None, colour=None, figure=None):
		actual_moves = list()  # doesn't consider other pieces blocking way

		for direction in moves + capture_moves:
			sprinter = direction[0] == "*"
			if sprinter:
				direction = direction[1:]

			rel_x, rel_y =  0, 0
			for step in direction:
				if step == "N":
					rel_y += UP
				elif step == "S":
					rel_y += DOWN

				elif step == "W":
					rel_x += LEFT
				elif step == "E":
					rel_x += RIGHT

			distance = 1
			while (0 <= self.x + rel_x*distance < SIZE_X) and (0 <= self.y + rel_y*distance < SIZE_Y):
				if 0 <= self.y + rel_y < SIZE_Y:
					new_x = self.x + rel_x*distance
					new_y = self.y + rel_y*distance

				if direction in moves:
					if game[new_y][new_x] == LAND:
						actual_moves.append(direction)
				elif direction in capture_moves:
					if (game[new_y][new_x] is not LAND) and (game[new_y][new_x].colour is not colour):
						actual_moves.append(direction)


				#print(f"{direction*distance} => {game[new_y][new_x]}")
				if (game[new_y][new_x] is not LAND) or not sprinter:
					distance = SIZE_X * SIZE_Y  # overloading

				distance += 1

		return actual_moves

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

	def __add__(self, other):
		other = other if isinstance(other, Coordinate) else Coordinate.fromRelative(other)

		new_x = self.x + other[0]
		new_y = self.y + other[1]
		
		return Coordinate.fromTuple(new_x, new_y)

	def algebraic_movement(self, figure):
		self.figure = translate_algebra[figure]
		if game[self.y][self.x] is LAND:
			self.capture = ""
		elif game[self.y][self.x] is KING:
			self.capture = CHECK
		else:
			self.capture = CAPTURE

		return self.figure + self.capture + str(self)



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


#print("pony")
print(repr(figurines[WHITE][PAWN][0]), figurines[WHITE][PAWN][0].get_moves())

print(game)

for colour in COLOURS:
	print(colour)
	for figure_type, pieces in figurines[colour].items():
		print("\t", figure_type)
		
		try:
			for piece in pieces:
				print("\t\t", repr(piece))
		except:
			print("\t\t", repr(pieces))
