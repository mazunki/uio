#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 1 of the 6th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"

from sang import Sang

class Spilleliste:
	def __init__(self, listenavn):
		self._sanger = []
		self._navn = listenavn

	def lesFraFil(self, filnavn: str):
		with open(filnavn, "r") as f:
			songs = f.read().splitlines()

		song_pairs = [song.split(";") for song in songs]
		for title, artist in song_pairs:
			song = Sang(title, artist)
			self._sanger.append(song)

	def leggTilSang(self, nySang: Sang):
		self._sanger.append(nySang)

	def fjernSang(self, sang):
		if sang in self._sanger:
			self._sanger.remove(sang)

	def spillSang(self, sang):
		sang.spill()

	def spillAlle(self):
		for song in self._sanger:
			song.spill()

	def finnSang(self, tittel):
		for song in self._sanger:
			if song.sjekkTittel(tittel):
				return song
		else:
			return None

	def hentArtistUtvalg(self, artistnavn):
		s = []
		for song in self._sanger:
			if song.sjekkArtist(artistnavn):
				s.append(song)
		return s

	def __str__(self):
		return "\n".join([str(song) for song in self._sanger])