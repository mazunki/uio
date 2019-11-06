#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as part of the solution to activity 1 of the 8th assignment of
	IN1000 at UiO, fall 2019.

	Defines a Cell, a Row of cells, and a prettyprinter for cells, depending on their age.

	A cell is not a living organism, but rather a tile on the board.
	
	This tile is either alive or dead, depending on the given moment. Once revived, age is zero,
	while each generation will prolong its life (useful for keeping track of stubborn tiles).

	Running a `for item in Cell` loop on an item will go through all of this cell's neighbours. This
	might seem like unpredicted behaviour, but as a cell is an atomic unit in this game, this should
	probably not be an issue anyway.

	The colour function works using ANSI-colours in Bash. The order of colours in ANSI is not intuitive, 
	so colours will appear to change randomly, but converting RGB into ANSI doesn't seem straightforward,
	without hardcoding all colours. I've used the core idea of this function in another program earlier, although
	it's expanded for this program's needs.

	Defining Row as its own class facilitates printing the board.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "6th November 2019"

class Color:
	colours = {
		"custom": "\033[38;5;<re>m",
		"white": "\033[38;5;256m",
		"default": "\x1b[0m"
	}
	@staticmethod
	def str(colour, str_):
		return Color.colours[colour] + str(str_) + Color.colours["default"]
	@staticmethod
	def str_d(colour, str_):
		return Color.colours["custom"].replace("<re>", str(colour)) + str(str_) + Color.colours["default"]



class Row(list):
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)

	def __str__(self):
		return "|" + " ".join([str(item) for item in self]) + "|"
	def __repr__(self):
		return "|" + " ".join([repr(item) for item in self]) + "|"



class Cell:
	def __init__(self, x, y, parent, alive=True):
		self.alive = alive
		self.old_state = None
		self.x, self.y = x, y
		self.parent = parent
		self.age = 0

	def kill(self):
		self.old_state = self.alive
		self.alive = False
		self.age = 0

	def revive(self):
		self.old_state = self.alive
		self.alive = True

	def prolong_life(self):
		self.old_state = self.alive
		self.age += 1

	def find_life(self):
		return sum(1 for n_cell in self.neighbours if n_cell.alive)  # creates a list with alive number of 1 elements, and return the sum of these

	def __str__(self):
		return Color.str_d(self.age, u"\u2a00") if self.alive else Color.str("white", u"\u00b7")  # Circled Dot Operator or \cdot

	def __repr__(self):
		vitality = "T" if self.alive==True else "F" if self.alive==False else self.alive
		return f"<{self.x},{self.y}:{vitality}{self.age}>"

	def __iter__(self):
		""" Cheating function to loop through neighbour cells """
		x_cap = len(self.parent)
		y_cap = len(self.parent[0])

		# Loop through neighbourhood, check validity of tiles, and yield valid cells
		for x in [self.x-1, self.x, self.x+1]:
			for y in [self.y-1, self.y, self.y+1]:
				if 0 <= x < x_cap and 0 <= y < y_cap:
					if not (self.x == x and self.y == y):
						yield self.parent[x][y]

	def get_neighbours(self):
		self.neighbours = list()
		for n_cell in self:
			self.neighbours.append(n_cell)
		return self.neighbours