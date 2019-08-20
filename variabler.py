#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Utskrift og innlesing med variabler

This module serves as the answer for the first part of the first delivery of
IN1000 at UiO (Fall, 2019). Overly engineered, for a simple exercise.

"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "20th August 2019"

navn = str()
sammen = str()
new_name = str()


def salute(custom_name:bool = False, two_names:bool=False, separated:bool=False) -> None:
	"""
		A function to solve the different activities regarding names of
		the activity sheet.
		Using global variables to avoid return statements, and doing some
		hacking due to exclamation marks, and whatnot.

		Args:
			custom_name (bool): Whether the printed name should follow
								a default value or not
								Irrelevant if two_names is True.

			two_names (bool):	Whether the printed name is composed of two
								different names.

			separated (bool):	Used if two_names is True, but requires a
								new_name to have been set already (if not,
								the new_name will be empty)
								This could be circumvented by checking if the
								string is empty before going through, but
								unnecessary for this assignment.
		Returns:
			None
	"""
	global navn, sammen, new_name

	if not two_names: 
		if not custom_name: 
			# For the first activy we use a default name. 
			navn = "Student!"

		else:
			# For the second one, we want an input from the standard
			# input (the terminal).
			navn = input("What's your name? ")
		print(f"Hei {navn}")

	else:

		if not separated:
			new_name = input("Give me a second name, please: ")
			sammen = navn + new_name + "!"
		else:
			sammen = navn + " og " + new_name
		
		print(sammen)


def two_digits(show_difference:bool=False) -> None:
	"""
		A function to solve the excercises regarding to integers from the
		activity sheet.

		Args:
			show_difference (bool):
				If True, prints the difference between the two local integers.
				If False, prints both integers.
		Returns:
			None
	"""
	x, y = 1, 7
	if not show_difference:
		print(x, y, sep="\n") 		# The \n adds a new line between both
									# digits, as requested by the activity.
	else:
		z = x - y
		print("Differanse:", z)		# Adds a space between the colon and the
									# digit, which is parsed into str(z)



if __name__ == '__main__':
	salute()  # Activity 1.2
	salute(custom_name=True)  # Activity 1.3

	two_digits()  # Activity 1.4
	two_digits(show_difference=True)  # Activity 1.5

	salute(two_names=True)  # Activity 1.6
	salute(two_names=True, separated=True)  # Activity 1.7