#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 2 of the 4th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "15th September 2019"

def fetch_numbers() -> list:
	""" Adds numbers to a list until user tries to add a zero-value integer.
	Ignores non-integer inputs """
	uinput = None
	ulist = list()
	while uinput is not "0":
		try:
			uinput = input("Give me a number: ")
			ulist.append(int(uinput))
		except ValueError:
			print("Not a valid number: `" + uinput + "`.")

	return ulist[:-1] # last 0 is ignored


def print_numbers(lst: list):
	for item in lst:
		print(item)

def print_sum(lst: list):
	""" Functionally the same as sum(iterable), with printing """
	minSum = 0
	for item in lst:
		minSum += item

	print(minSum)
	return minSum

def find_max(lst: list):
	""" Functionally the same as max(iterable), with printing """
	maxValue = lst[0]  # Assume first is the answer
	for item in lst:
		if item > maxValue:
			maxValue = item

	print(maxValue)
	return maxValue


def find_min(lst: list):
	""" Functionally the same as min(iterable), with printing """
	minValue = lst[0]  # Assume first is the answer
	for item in lst:
		if item < minValue:
			minValue = item

	print(minValue)
	return minValue


if __name__ == '__main__':
	ulist = fetch_numbers()  # Activity 2.1, 2.2
	print_numbers(ulist)  # Activity 2.3
	print_sum(ulist)  # Activity 2.4
	find_max(ulist)  # Activity 2.5
	find_min(ulist)  # Activity 2.5
