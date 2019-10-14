#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 1 of the 6th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"


class Sang:
	def __init__(self, tittel: str, artist: str):
		self._tittel = tittel
		self._artist = artist

	def spill(self):
		print(self)

	def sjekkArtist(self, navn: str):
		return navn.lower() == self._artist.lower()

	def sjekkTittel(self, tittel: str):
		return tittel.lower() == self._tittel.lower()

	def sjekkArtistogTittel(self, artist, tittel):
		return self.sjekkArtist(artist) and self.sjekkTittel(tittel)

	def __str__(self):
		return f"Spiller {self._tittel} fra {self._artist}"