#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 3 of the 5th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "19th September 2019"


def​ minFunksjon​():
	for​ x ​in​ range​(​2​):  # runs the following block of code twice with the values x as 0 and 1, respectively, stored in this function
		c ​=​ 2  # assigns the value 2 for c inside this function, setting it back to `2` the second time block is run
		​print​(​c)  # prints the value `2` as it is redefined each for-loop.
		c ​+=​ 1  # redefines c to `3` inside this function
		b ​=​​ 10  # assigns the value `10` to b inside this function
		b ​+=​ a  # causes a NameError Exception, as a is not defined in this function
	   	​​print​(​b​)  # would print `10` on screen if line 19 was ignored (never reaches this)
	return​(​b​)  # would return `10` to the output of the function if line 19 was ignored (never reaches this)

def hovedprogram():  # called by line 33
	a ​=​​ 42  # defines 42 for a inside this function
	b ​=​ 0  # defines 0 for b inside this function
	print​(​b​)  # prints the value `0` to screen
	b ​=​ a  # reassigns 42 to b inside this function
	a ​=​ minFunksjon​()  # assigns the return value of `minFunskjon()` (10) to a inside this function (although crashes)
	print​​(​b​)  # prints the value `42` to screen (never reaches this point)
	print​​(​a​)  # prints `10` to the screen (never reaches this point)


hovedprogram()