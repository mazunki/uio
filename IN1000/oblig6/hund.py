#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as half of the solution to activity 4 of the
	6th assignment of IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"


class Hund:
	def __init__(self, alder, vekt):  # Activity 4.1
		self.alder = alder
		self.vekt = vekt
		self.metthet = 10


	# Activity 4.2
	def get_alder(self):
		return self.alder


	def get_vekt(self):
		return self.vekt


	# Activity 4.3
	def spring(self):
		self.metthet -= 1
		if self.metthet < 5:
			self.vekt -= 1


	# Activity 4.4
	def spis(self, quantity):
		self.metthet += quantity
		if self.metthet > 7:
			self.vekt += 1