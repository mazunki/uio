#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 3 of the 3rd assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "4th September 2019"

def get_price(user="Passenger"):

	alder = int(input("What is your age? "))
	# Since is where the user can entry data, this is where the program can fail (mostly, anyway.)
	# If the user inputs any kind of letter, a ValueError Exception will cause the program to
	# close. We could catch this with a try-except block, and loop through the input() until a valid
	# input is given. I've chose to ignore this for this example, since it's trivial to explain it.
	#
	# Another way to crash the program is by Ctrl+C or Ctrl+D'ing at this (or any) point, which would
	# close the program (either by a SIGINT (-2 signal) causing a KeyboardInterrupt, or a SIGTERM (-15 signal)
	# which would just close quietly) unexpectedly.
	#
	# Lastly, we must consider the quiet error where the user inputs a decimal nummber such as 15.9, which would
	# cause a quiet truncation of the number, instead of rounding to nearest number. This may or may not be
	# what we intend. For ticket prices I assume this truncation is actually desired. 


	billetpris = 0  # this is rather pointless and more confusing than rewarding.

	# billetpris = 35 if alder > 63 else 50 if alder > 17 else 30
	if alder <= 17:
		billetpris = 30
	elif alder < 63:
		billetpris = 50
	else:
		billetpris = 35
	print()
	print(u"""Hello, Mx. {}.
Since you are of age {}, the price of your ticket is of {},\u2014 NOK.

Have a nice trip!""".format(user, alder,billetpris))  # Mx. being the neutral form of Mr/Miss/Mrs/etc. \u2014 == \emdash


if __name__ == '__main__':
	for _ in range(4):
		get_price()