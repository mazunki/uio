#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 5 of the 3rd assignment of
	IN1000 at UiO, fall 2019.

	The proposed idea is to simulate a parametrised Connect-4 game. Loops until a winner
	is found, and closes program, announcing a winner.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "5th September 2019"


X, O, E = "X", "O", "-"
turn = X  # starts at O, due to swapping

GAME_X, GAME_Y = 7, 6
CONNECT = 4
game = [[E for x in range(GAME_X)] for y in range(GAME_Y)]

import os, sys
CMD_CLEAR_SCREEN = lambda: print("\033[2J") if os.name == "linux" else print("\n"*64)

	return key

def print_game(g=game):
	for row in game:
		print("| "+" | ".join(row)+" |")

def get_winner(g=game, x=0, y=0):
	"""
		First, creates four lists based on current new position (this is far more efficient for larger maps),
		as it makes no sense to check for areas of graph which haven't changed.
		Since a victory can be possible for in a radius of +3 from the current position, each tuple will have 7 elements, excluding boundaries,
		going in four directions. Horizontal, Vertical, and the two diagonals..
		Boundaries are calculated based on where radius hits the border of the map for each direction.

		Finally, we go through each of these tuples counting for a sequence of four equal elements, ignoring empty spaces. This is done
		by swapping the current colour to the current one in iteration, and if current colour is equal to the previous iteration,
		add to a counter. If counter hits three, that means that the three previous elements are the same colour as this one, so we can 
		guarantee a winner.
	"""
	# horizontal
	x_lbound = max(0, x-CONNECT-1)
	x_rbound = min(GAME_X-1, x+CONNECT-1)
	horizontal = game[y][x_lbound:x_rbound+1]

	# vertical
	y_tbound = max(0, y-CONNECT-1)
	y_bbound = min(GAME_Y-1, y+CONNECT-1)
	vertical = [row[x] for row in game[y_tbound:y_bbound+1]]

	# diagonal /
	max_up = min(y, GAME_X-x-1, CONNECT-1)
	max_down = min(GAME_Y-y-1, x, CONNECT-1)
	diagonal_nw = [ game[y-i][x+i] for i in range(-max_down, max_up+1) ]

	# diagonal \
	max_up = min(y, x, CONNECT-1)
	max_down = min(GAME_Y-y-1, GAME_X-x-1, CONNECT-1)
	diagonal_sw = [ game[y-i][x-i] for i in range(-max_down, max_up+1) ]


	# check for winner in lists
	for candidate_winner in [horizontal, vertical, diagonal_nw, diagonal_sw]:
		last_find, c = E, 0

		for col in candidate_winner:
			if col == last_find and col is not E:
				c += 1
				if c >= CONNECT-1:  # last_find + 3 new ones
					return last_find
			last_find = col

	return None  # fallback if no winner

def new_turn(g=game):
	global turn
	print_game(g)

	pos = None
	while pos not in range(GAME_X):
		pos = int(input(turn + f"'s turn. Column [0-{GAME_X-1}]: "))

	y = GAME_Y  # assume piece falls to the bottom
	
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