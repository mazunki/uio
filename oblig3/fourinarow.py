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
CMD_CLEAR_SCREEN = lambda: print("\033[2J") if os.name == "linua" else print("\n"*4)

def print_game(g=game):
	for row in game:
		print("| "+" | ".join(row)+" |")

def get_winner(g=game, x=0, y=0):
	x_lbound = max(0, x-3)
	x_rbound = min(GAME_X-1, x+3)
	y_tbound = max(0, y-3)
	y_bbound = min(GAME_Y-1, y+3)
	print("xl:",x_lbound, "xr:", x_rbound, "yt:", y_tbound, "yb", y_bbound)

	horizontal = game[y][x_lbound:x_rbound+1]
	vertical = [row[x] for row in game[y_tbound:y_bbound+1]]

	# /
	dx = max(x-3, 0)
	dy = min(GAME_Y-y+3, GAME_Y-1)
	print(f"down: {dx}x,{dy}y")
#	diagonal_nw = [ game[y][x] ]

#	print(diagonal_nw)

	return None  # fallback if no winner

def new_turn(g=game):
	global turn
	print_game(g)
	pos = None
	while pos not in range(GAME_X):
		pos = int(input(turn + "'s turn. Column [0-6]: "))
	
	y = GAME_Y
	for row in reversed(game):  # checking bottom first, and going up
		y -= 1
		if row[pos] == E:
			row[pos] = turn  # although this is a local scope, nested lists are actually referencial!
			break  # as soon as we place a piece, we don't need to check upwards, so we just break out of the for-loop

	turn = X if turn == O else O

	return pos, y

winner = None

while winner == None:
	CMD_CLEAR_SCREEN()
	last_index = new_turn()
	winner = get_winner(game, *last_index)
else:
	print_game()
	print("Winner {}!".format(winner))

#a = [[1,2,3], [4,5,6], [7,8,9]]

#print( list(zip(*a)))