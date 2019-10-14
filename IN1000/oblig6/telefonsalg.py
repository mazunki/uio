#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 1 of the 6th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"


def innlesing(fn="salgstall.txt"):
	""" Reads statistical data from a file,
	returns dictionary of values.

	Might as well have been donde with json.load(), and using
	json.dumps(), as this simplifies prettyprinting data.
	"""

	statistical_dict = dict()

	with open(fn, "r") as f:
		pairs = f.read().strip().split("\n")

	for key, value in [pair.split(" ") for pair in pairs]:
		if statistical_dict.get(key):  # returns None if non-existent
			statistical_dict[key] += int(value)
		else:
			statistical_dict[key] = int(value)
	return statistical_dict


def maanedensSalgsperson(data):
	return max(data, key=data.get)


def totaltAntallSalg(data):
	return sum(data.values())


def gjennomsnittSalg(data):
	return totaltAntallSalg(data)/len(data.keys())


def hovedprogram():
	my_data = innlesing()  # Activity 1.1
	
	monthly_employee = maanedensSalgsperson(my_data)  # Activity 1.2
	total_sales = totaltAntallSalg(my_data)  # Activity 1.3
	average_sales = gjennomsnittSalg(my_data)  # Activity 1.4


	# Activity 1.5
	print(f"Maanedens ansatte er Tina med {my_data[monthly_employee]} salg.")
	print()
	print(f"Aktive selgere denne maaneden: {len(my_data.keys())}")
	print(f"Total antall salg: {total_sales}")
	print(f"Gjennomsnittlig antall salg per salgsperson: {average_sales}")

if __name__ == '__main__':
	hovedprogram()  # Activity 1.6
