#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Utskriftsprosedyre

This module serves as the answer for the first part of the second delivery of
IN1000 at UiO (Fall, 2019).

"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "2nd September 2019"


INPUT_NAME = "Skriv inn navn: "
INPUT_LOCATION = "Hvor kommer du fra? "


def ask_name_place() -> None:
	name = input(INPUT_NAME)
	location = input(INPUT_LOCATION)
	print(f"Hei, {name}! Du er fra {location}")

if __name__ == '__main__':
	ask_name_place()  # Activity 1.1

	# Activity 1.2
	for _ in range(3):
		ask_name_place()