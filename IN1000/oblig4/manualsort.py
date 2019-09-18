#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 6 of the 4th assignment of
	IN1000 at UiO, fall 2019.

	The idea is to have a list, and the user has to sort it alphabetically. If successful, they win.
	If they don't, they suck.

	Use W and D to move left and right, use W to select and move.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "15th September 2019"

import random
N_ITEMS = 5
TABSYMBOL = "\t\t"
sample_list = [random.randint(-20, 20) for _ in range(N_ITEMS)]
#sample_list = [-1, -10, 0, 5, 20, -1]

def getch():
	import sys, termios, tty
	fd = sys.stdin.fileno()
	old_settings = termios.tcgetattr(fd)
	try:
		tty.setraw(fd)
		ch = sys.stdin.read(1)
	finally:
		termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
	return ch


def sort_list(my_list: list) -> list:
	""" Sorts a list alphabetically, like JavaShipt. Even for integers. """
	my_list = [str(obj) for obj in my_list]

	done = False
	while not done:
		done = True # assume list tis in order
		for item in range(len(my_list)-1):
			if my_list[item] > my_list[item+1]:
				my_list[item], my_list[item+1] = my_list[item+1], my_list[item]
				done = False

	return [int(item) for item in my_list]


def print_list(my_list, cursor, marked):
	print("\033[2J")
	print("Sort this list alphabetically!")
	output_list = my_list.copy()
	if marked is not None:
		output_list[marked] = "*"
	print(TABSYMBOL.join(str(item) for item in output_list))
	print(TABSYMBOL*cursor, end="")
	print (f"{'^':<{cursor*str_size}}")


if __name__ == '__main__':
	cursor = 0
	marked = None
	str_size = 8

	while not sample_list == sort_list(sample_list):
		print_list(sample_list, cursor, marked)
		#print(sort_list(sample_list))

		char = getch()
		if char == "d":
			cursor = (cursor + 1) % N_ITEMS
		elif char == "a":
			cursor = (cursor - 1) % N_ITEMS
		elif char == "w":
			if marked:
				sample_list[cursor], sample_list[marked] = sample_list[marked], sample_list[cursor]
				marked = None
			else:
				marked = cursor
		elif char == "q":
			break

	else:
		print_list(sample_list, cursor, marked)
		print("You win!")