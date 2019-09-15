#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 4 of the 1st assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "15th September 2019"


# Activity 4.1
steder = list()
for _ in range(5):
	steder.append(input("Where do you want to travel to? "))

# Activity 4.2
klesplagg = list()
avreisedatoer = list()
for _ in range(5):
	klesplagg.append(input("What do you want to add to your clothes? "))
for _ in range(5):
	avreisedatoer.append(input("What do you want to add to your dates? "))


# Activity 4.3
reiseplan = [steder, klesplagg, avreisedatoer]  # this makes little sense, use a dictionary or something


# Activity 4.4
for item in reiseplan:
	print(item)

# Activity 4.5
i1 = int(input(f"Which list do you want to access? [0-{len(reiseplan)-1}] "))
if i1 not in range(len(reiseplan)):
	print("Ugyldig input!")
	exit()

i2 = int(input(f"Okay, so what target of the given list do you want to check? [0-{len(reiseplan[i1])-1}] "))
if i1 not in range(len(reiseplan[i1])):
	print("Ugyldig input!")
else:
	print(reiseplan[i1][i2])