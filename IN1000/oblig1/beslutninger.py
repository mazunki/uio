#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Beslutninger

This module serves as the answer for the second part of the first delivery of
IN1000 at UiO (Fall, 2019). Overly engineered, for a simple exercise.

"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "20th August 2019"


# Global strings
SODA = "Her har du en brus!"
NO_SODA = "Den er grei."
MISUNDERSTOOD = "Det forstod jeg ikke helt."

wants_soda = None


def soda(ask_question:bool) -> None:
	"""
		Simple function which asks the user if they want a soda or not.
		Prints an answer to the default output, the terminal.

		Args:
			None
		Returns:
			None
	"""
	global wants_soda

	if ask_question:
		wants_soda = input("Ønsker du deg en brus? ").lower()
	else:
		if wants_soda in ["y", "yes", "j", "ja"]: # different shortcuts/conventions
			print(SODA)
		elif wants_soda in ["n", "no", "nei"]:  # and support for two languages!
			print(NO_SODA)
		else:
			print(MISUNDERSTOOD)


if __name__ == '__main__': 
	"""
		`__name__` is defaulted to "__main__" if program is run directly,
		unlike if the module is imported.
	"""
	soda(ask_question=True)  # Activity 2.1
	soda(ask_question=False)  # Activity 2.2
