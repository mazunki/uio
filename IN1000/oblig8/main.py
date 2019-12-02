#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as part of the solution to activity 1 of the 8th assignment of
	IN1000 at UiO, fall 2019.

	This file parses the arguments given by running the program. Valid inputs are:
		-v				prints verbose information, useful for debugging
		-h				prints a help dialogue, and quits
		--auto			automatically runs through generations
		--generator 	allows the user to select what generator to use
			random			default, randomly gives life to ~33% of tiles
			custom			requires --file, user-given input (might add STDIN to pipe `echo` or something...)
							(keep in mind that --size can be added to crop the input.)
				--file 			selects the given file to use as userdata
					file 			file is given as a comma-separated and line-separated for columns and rows
									accordingly. empty, non-defined and `x` cells are interpreted as dead, while
									`o` cells are interpreted as alive.
			chess 			alternates between dead and alive cells (predicted, although cool behaviour)
			fill 			fills the board with alive cells (also predicted behaviour)
		--size 			sets the size for the board, instead of asking for it. can also be used if a custom file is
						given, to crop it, but this is not necessary (as it will by default expand the board to give
						place to the amount of cells that are given)

"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "6th November 2019"

import random, time, sys
from board import *
from cell import *

max_gens = float("+inf")
def init():
	if "--generator" not in sys.argv:
		generator = "random"  # default
	else:
		try:
			generator = sys.argv[sys.argv.index("--generator")+1]
			assert generator in ["random", "custom", "chess", "fill"], generator
			if generator == "custom":
				try:
					file_generator = sys.argv[sys.argv.index("--file")+1]
				except ValueError:
					print("Custom generator requires a filename! Use --file <filename> to add.")
					quit()
				else:
					with open(file_generator, "r") as fg:
						file_array = [row.split(",") for row in fg.read().splitlines()]
		except AssertionError:
			print(f"`{generator}` isn't a valid generator.")
			quit()
		except (FileNotFoundError, IndexError):
			print("Given file doesnt exist.")
			quit()

	try:
		if "--size" in sys.argv:
			x = int(sys.argv[sys.argv.index("--size")+1])
			y = int(sys.argv[sys.argv.index("--size")+2])
		elif generator == "custom":  # if --generator is custom, calculate size based on input
			x = max([len(row) for row in file_array])
			y = len(file_array)
		else:  # fallback, just ask the user
			x = int(input("Width: "))
			y = int(input("Height: "))
	except ValueError:
		print("Size must be numeric!")
		quit()
	except KeyboardInterrupt:
		quit("")

	try:
		if "--max" in sys.argv:
			global max_gens
			max_gens = int(sys.argv[sys.argv.index("--max")+1])
	except ValueError:
		print("Generations must be a number!")
		quit()

	if generator == "custom":
		return Board(x_size=x, y_size=y, generator=generator, fg=file_array)
	else:
		return Board(x_size=x, y_size=y, generator=generator)



def main():
	my_board = init()
	i = 0

	try:
		stop = False
		while not stop:
			if "--auto" not in sys.argv:
				stop = input(f"Generation: {i}. Press enter to continue.")
			else:
				time.sleep(0.3)  # better animation, and helps against lag causing board movement
				print("\033[2J")
				print(f"Generation {i}")
				stop = False

			if "-v" in sys.argv:
				print(repr(my_board))
			else:
				print(my_board)

			if not my_board.still_running():
				print("That's all, folks!")
				stop = True		
			else:
				i += 1
				my_board.next_generation()

			if i > max_gens:
				stop = True

	except KeyboardInterrupt:
		quit()

if __name__ == '__main__':
	
	if not "--help" in sys.argv and not "-h" in sys.argv:
		main()
	else:
		print(
"""Usage: python3 main.py [--size <x> <y>] [--generator <generator> [--file <filename>]]
			[-v] [--max <generations>] [--auto]

Supported generators:
	— random [default]
	— custom (requires [--file <filename>])
		If no size is provided, it will fill until it fits.
	— fill
	— chess

Use -v for verbose/debugging information.
Use -h to print this.
Use --auto to automatically update generations."""
)

