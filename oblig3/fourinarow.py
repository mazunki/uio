#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 5 of the 3rd assignment of
	IN1000 at UiO, fall 2019.

	Inspired by a request from `cburja`, this program will read the genre of a song
	given by its URL from http://rateyourmusic.com, and return the corresponding list
	of genres.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "5th September 2019"


X, O, E = "X", "O", "-"
turn = X  # starts at O, due to swapping

GAME_X, GAME_Y = 7, 6
game = [[E for x in range(GAME_X)] for y in range(GAME_Y)]

import os
CMD_CLEAR_SCREEN = lambda: print("\033[2J") if os.name == "linux" else print("\n"*64)

def print_game(g=game):
	for row in game:
		print("| "+" | ".join(row)+" |")

def get_winner(g=game):
	# horizontal wins
	for row in g:
		last_find, c = E, 0

		for col in row:
			if col == last_find and col is not E:
				c += 1
				if c >= 3:  # last_find + 3 new ones
					return last_find

			last_find = col

	# vertical wins
	for col in list(zip(*g)):  # zip(*[ [a,b,c], [d,e,f] ]) returns [[a,d],[b,e],[c,f]], effectively turning list sideways
		c = 0
		for row in col:
			if row == last_find and row is not E:
				c += 1
				if c >= 3:
					return last_find
			last_find = row



	return None  # fallback if no winner

def new_turn(g=game):
	global turn
	print_game(g)
	pos = None
	while pos not in range(GAME_X):
		pos = int(input(turn + "'s turn. Column [0-6]: "))
	

	for row in reversed(game):  # checking bottom first, and going up
		if row[pos] == E:
			row[pos] = turn  # although this is a local scope, nested lists are actually referencial!
			break  # as soon as we place a piece, we don't need to check upwards, so we just break out of the for-loop

	turn = X if turn == O else O



while get_winner() == None:
	CMD_CLEAR_SCREEN()
	new_turn()
else:
	print_game()
	print("Winner {}!".format(get_winner()))

#a = [[1,2,3], [4,5,6], [7,8,9]]

#print( list(zip(*a)))