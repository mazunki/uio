#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 1 of the 5th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "19th September 2019"


def addisjon(a: float, b: float) -> float:
	 return float.__add__(float(a), float(b))

def substraksjon(a: float, b: float) -> float:
	return float.__sub__(float(a), float(b))

def divisjon(a: float, b: float) -> float:
	return float.__truediv__(float(a), float(b))

def tommerTilCm(antallTommer: float) -> float:
	try:
		assert (antallTommer > 0.0), None
		return float(antallTommer).__mul__(2.54)
	except AssertionError as e:
		return e

def skrivBeregninger():
	# a
	user_int_a = float(input("Give me a number: "))
	user_int_b = float(input("Give me another number: "))

	print("Summen er", addisjon(user_int_a, user_int_b),
	"\nSubstraksjonen er", substraksjon(user_int_a, user_int_b),
	"\nDivisjonen er", divisjon(user_int_a, user_int_b))

	# b
	user_int_c = float(input("Give me a third number: "))
	print(user_int_c, "cm is", tommerTilCm(user_int_c), "inches.")


if __name__ == '__main__':
	print(addisjon(1,1))  # Activity 1.1
	print(substraksjon(1,3))  # Activity 1.2a
	print(divisjon(5,2))  # Activity 1.2a


	# Activity 1.2b
	assert addisjon(1,1) == 2
	assert addisjon(-1,-3) == -4
	assert addisjon(-1,1) == 0

	assert substraksjon(1,1) == 0
	assert substraksjon(-1,-3) == 2
	assert substraksjon(-1,1) == -2

	assert divisjon(1,1) == 1.0
	assert divisjon(-1,-3) == 1/3
	assert divisjon(-1,1) == -1.0


	# Activity 1.3
	assert tommerTilCm(1) == 2.54
	print(tommerTilCm(-1))
	# assert tommerTilCm(-1) == None  # doesn't work, I don't understand why


	skrivBeregninger()  # Activity 1.4