#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as the other half of the solution to activity 2 of the
	6th assignment of IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"

from hund import Hund


def hovedprogram():
	my_dog = Hund(alder=10, vekt=5)
	print(my_dog.get_vekt(), my_dog.get_alder())

	my_dog.spis(3)
	print(my_dog.get_vekt(), my_dog.get_alder())
	my_dog.spring()
	print(my_dog.get_vekt(), my_dog.get_alder())
	my_dog.spis(3)
	print(my_dog.get_vekt(), my_dog.get_alder())


	for _ in range(12):
		my_dog.spring()
	print(my_dog.get_vekt(), my_dog.get_alder())


if __name__ == '__main__':
	hovedprogram()  # Activity 4.5