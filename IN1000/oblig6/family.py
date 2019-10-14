#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as the solution to activity 6 of the
	6th assignment of IN1000 at UiO, fall 2019.

	The idea is to have the definition of a person, and construct a family
	tree of ancestors out of the known data.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "3rd October 2019"
import datetime

class Color:
	colours = {
		"lred": "\033[91m",
		"lgreen": "\033[92m",
		"yellow": "\033[93m",
		"default": "\x1b[0m"
	}
	@staticmethod
	def str(colour, str_):
		return Color.colours[colour] + str(str_) + Color.colours["default"]

class Person:
	def __init__(self, name, birthday=None, age=None, 
	parents=list(), parent1=None, parent2=None, dead=False):
		
		self.name = name
		
		today = datetime.datetime.today()
		if birthday:
			self.birthday = datetime.datetime.strptime(birthday, "%d%m%Y")
			self.age = today.year - self.birthday.year - ((today.month, today.day) < (self.birthday.month, self.birthday.day))
		elif age:
			self.birthday = datetime.datetime.strftime("%d%m%Y", "0101"+str(datetime.datetime.today().year - self.age))
			self.age = age
		else:
			self.birthday = None
			self.age = None

		self.dead = dead
		if dead:
			self.age = -1

		self.parents = list(parents)
		if parent1:
			self.parents.append(parent1)
		if parent2:
			self.parents.append(parent2)

	def __str__(self):
		ancestors = ""
		if self.parents:
			ancestors = ancestors + "(" + u"\u2014".join(map(str, self.parents)) + ")"

		if self.dead:
			return ancestors + self.name +  Color.str("lred", u"\u271d")
		elif self.age:
			return ancestors + self.name +  Color.str("lgreen", self.age)
		else:
			return ancestors + self.name +  Color.str("yellow", "?")



ddgrandpa = Person("Rolf Arne", dead=True)
dgrandpa = Person(name="Rolf Arne a", parents=[ddgrandpa], dead=True)
dgrandma = Person(name="Vigdis")
dad = Person(name="Vidar", birthday="07051967", parents=[dgrandpa,dgrandma])

print(dad)
print()

mgrandpa = Person(name="Leif Arvid", birthday="01011997", dead=True)
mgrandma = Person(name="Signe")
mom = Person(name="Tove Iren", birthday="01011961", parents=[mgrandma, mgrandpa], dead=True)
print(mom)
print()

me = Person(name="Rolf Vidar", birthday="11031997", parent1=dad, parent2=mom)
print(me)
