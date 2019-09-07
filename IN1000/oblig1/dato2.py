#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Problemløsning med beslutninger

This module serves as the answer for the last and optional part of the first
delivery of IN1000 at UiO (Fall, 2019). Overly engineered, for a simple
exercise.

Based on a copy of `dato.py`
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "20th August 2019"


# Global variables
SAME_DATE = "Samme dato!"
INCREMENTING_DATE = "Riktig rekkefølge!"
DECREASING_DATE = "Feil rekkefølge!"
QUESTION = "Du blir nå spurt om to datoer. Formatet er DDMM, der 1. Desember \
blir 0112"

date_1 = date_2 = None, None  # (date, month)

def date(ask_dates:bool) -> None:
	"""
		A function which either redefines the values for dates, or prints 
		the corresponding output depending on whether the the dates
		are in ascending or descending order.

		Args:
			ask_dates (bool):
				If True, asks the user for the values for `date_1` and
				`date_2`.
				If False, prints the corresponding answer.
		Returns:
			None
	"""
	global date_1, date_2

	if ask_dates:
		print(QUESTION)

		try:
			date_1 = input("Først dato: ")
			assert len(date_1)==4
			date_1 = int(date_1[:2]), int(date_1[2:])
			
			date_2 = input("Andre dato: ")
			assert len(date_2)==4
			date_2 = int(date_2[:2]), int(date_2[2:])

			for date_ in [date_1, date_2]:
				# Dates are restricted to 1-31
				assert date_[0] in list(range(32))
				# Months are restricted to 1-12
				assert date_[1] in list(range(13))

		# If the user input is invalid, try again.
		except (AssertionError, ValueError) as e:
			print(
				"Use numbers from 01 to 12 for month, and 01 to 31 for dates.")
			print()
			date(ask_dates=True)


	else:
		# If both DD and MM are equal, then the date is the same
		if date_1 == date_2:
			print(SAME_DATE)

		# First we check if we're in within the same month, where date matters
		elif (date_1[1] == date_2[1]):
			# and then the date of the month
			if (date_1[0] > date_2[0]):
				print(DECREASING_DATE)
			else:
				print(INCREMENTING_DATE)

		# If we're not in the same month, date of month is irrelevant.
		else:
			if (date_1[1] > date_2[1]):
				print(DECREASING_DATE)
			else:
				print(INCREMENTING_DATE)


if __name__ == '__main__':
	date(ask_dates=True)  # Activity 3.3
	date(ask_dates=False)  # Activity 3.2