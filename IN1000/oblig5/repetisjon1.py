#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 4 of the 5th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "19th September 2019"


mineOrd = list()

def slaaSammen(str1: str, str2: str) -> str:
	return str1 + str2

def skrivUt(iterable):
	for item in iterable:
		print(item)

user_input = None
while user_input is not "s":

	user_input = input("What do you want to do? [i]nsert, o[u]tput ")
	if user_input == "i":
		str1 = input("Okay, let's concat your strings. What's first? ")
		str2 = input("And then...? ")
		mineOrd.append(slaaSammen(str1, str2))

	elif user_input == "u":
		skrivUt(mineOrd)

else:
	print("Bye!")