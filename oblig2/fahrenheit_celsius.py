#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Konvertering

This module serves as the answer for the second part of the second delivery of
IN1000 at UiO (Fall, 2019). Overly engineered, for a simple exercise.

"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "2nd September 2019"


def fahr_to_cels(fahr):
	return float(fahr-32)*5.0/9.0

def cels_to_fahr(cels):
	return (cels * 9.0/5.0) + 32

def calc_cels(my_fahrenheit=None, operate=True, verbose=False, vv=False):
	if not isinstance(my_fahrenheit, (int, float)):  # forces invalid args to be ignored
		my_fahrenheit = float(input("Temperature in Fahrenheit: "))

	if operate:
		my_celsius = fahr_to_cels(my_fahrenheit)
	
	if vv:  # requires `operate` to be True
		print(f"{my_fahrenheit:0.2f} F = {my_celsius:0.2f} C")
	elif verbose:
		print(f"{my_fahrenheit:0.2f}")


if __name__ == '__main__':
	calc_cels(my_fahrenheit=-40, operate=False)  # Activity 2.1
	calc_cels(my_fahrenheit=-40, operate=False, verbose=True)  # Activity 2.2
	calc_cels(my_fahrenheit=10, operate=True)  # Activity 2.3
	calc_cels(my_fahrenheit=0, vv=True)  # Activity 2.4
	calc_cels(vv=True)  # Activity 2.5