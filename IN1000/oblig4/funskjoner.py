#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 1 of the 1st assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "15th September 2019"

import sys
print(sys.version)

def adder(tall1: int, tall2: int) -> int:
	""" Returns the sum of two integers. Functionally
	the same as int.__add__(tall1, tall2) """
	return tall1 + tall2


def tellForekomst(minTekst: str, minBokstav: str) -> int:
	""" Returns the number of times a character (or entity) appears in a string (or
	any kind of iterable) """
	return minTekst.count(minBokstav)



if __name__ == '__main__':
	# Acticity 1.1
	print("Sum of 1 and 2 is ", adder(1, 2))
	print("Sum of 2 and 3 is ", adder(2, 3))

	# Acticity 1.2
	user_str = input("Give me the string you want to check for: ")
	user_char = input("What letter do you want to check for? ")[0]  # only the first letter
	print("Found the letter `" + user_char + "` in the provided string", tellForekomst(user_str, user_char), "times.")

	# Activity 1.3
	# Already did this for 1.2 before even reading it.