#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 2 of the 5th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "19th September 2019"


def get_average(iterable):
	avg, n = 0.0, len(iterable)
	for item in iterable:
		avg += item
	return avg/n

with open("temperatur.txt", "r") as f:
	temps = [int(temp) for temp in f.read().split()]

print("Average temp:", get_average(temps))