#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as the other half of the solution to activity 2 of the
	6th assignment of IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"

# Activity 2.5
from motorsykkel import Motorsykkel as MC

def hovedprosedyre():
	# Activity 2.6
	my_mc0 = MC(brand="Harley Davidson", reg_number="X123456Y", start_x=0)
	my_mc1 = MC(brand="Harley Davidfather", reg_number="X123457A", start_x=10)
	my_mc2 = MC(brand="Harley Davidholy-spirit", reg_number="X123458F", start_x=3000)

	for bike in [my_mc0, my_mc1, my_mc2]:
		bike.skrivUt()
		print()

	# Activity 2.7
	my_mc2.kjor(50)
	print(my_mc2.hentKilometerstand())


if __name__ == '__main__':
	hovedprosedyre()  # Activity 2.8