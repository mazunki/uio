"""
  This program is made as a solution to activity 5 of the 2nd assignment of
  IN1000 at UiO, fall 2019.

  The proposed idea is to input a chess scenario, either as an absolute matrix,
  or by giving the set of movements according to FIDE's standard algebraic notation.
  Check Appendix C at https://www.fide.com/fide/handbook.html?id=171&view=article

  The output will be a list of movements possible to do checkmate. None if there is no
  immediate checkmate.
"""

KING = "King"
QUEEN = "Queen"
ROOK = "Rook"
BISHOP = "Bishop"
KNIGHT = "Knight"
PAWN = "Pawn"
WHITE, BLACK = "White", "Black"

translate_x = {"a": 0,	"b": 1,		"c": 2,		"d": 3,		"e": 4,		"f": 5,		"g": 6,		"h": 7}
translate_y = {"8": 0,	"7": 1,		"6": 2,		"5": 3,		"4": 4,		"3": 5,		"2": 6,		"1": 7}
translate_symbol = {KING: "K", QUEEN: "Q", ROOK: "R", BISHOP: "B", KNIGHT: "N", PAWN: "P"}



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


class King(Piece):
	def __init__(self, game, colour, position=None):
		if not position:
			if colour == WHITE:
				position = Coordinate("e1")  # 4, 7
			elif colour == BLACK:
				position = Coordinate.fromTuple(4, 0)  # e8

		super().__init__(game=game, figure=KING, colour=colour, position=position)

class Queen(Piece):
	def __init__(self, game, colour, position=None):
		if not position:
			if colour == WHITE:
				position = Coordinate("d1")
			elif colour == BLACK:
				position = Coordinate("d8")

		super().__init__(game=game, figure=QUEEN, colour=colour, position=position)


class Pawn(Piece):
	def __init__(self, game, colour, position):
		super().__init__(game=game, figure=PAWN, colour=colour, position=position)
	
	@staticmethod
	def pawn_starts(colour):
		if colour == WHITE:
			row = "2"
		elif colour == BLACK:
			row = "7"
		return [y+row for y in list("abcdefgh")]


################
#  Board setup #
################

class Board:
	def __init__(self):
		self.game = [[" " for _ in range(8)] for _ in range(8)]

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

for colour in [WHITE, BLACK]:
	king = King(game, colour)
	queen = Queen(game, colour)
	my_pawns = list()
	for pawn_pos in Pawn.pawn_starts(colour):
		new_pawn = Pawn(game, colour, Coordinate(pawn_pos))

	print(king)
	print(repr(king.position))

print(game)