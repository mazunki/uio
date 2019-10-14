#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as half of the solution to activity 2 of the 6th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"

class Motorsykkel:
	# Activity 2.1
	def __init__(self, brand, reg_number, start_x=0):
		self.brand = brand
		self.reg_number = reg_number
		self.x = start_x

	# Activity 2.2
	def kjor(self, km):
		self.x += km

	# Activity 2.3
	def hentKilometerstand(self):
		return self.x

	# Activity 2.4
	def skrivUt(self):
		print(self)

	def __str__(self):
		return 	"Registreringsnummer: " + str(self.reg_number) + "\n" +\
				"Merke: " + str(self.brand) + "\n" +\
				"Kilometer: " + str(self.x) 
