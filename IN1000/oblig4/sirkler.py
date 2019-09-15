#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 3 of the 1st assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "15th September 2019"

import ezgraphics as ezg

win = ezg.GraphicsWindow(600, 400)
win.setTitle("Sirkler")
canv = win.canvas()

# by using range we don't need to manually increment a value, and
# we don't waste memory by saving the value
for teller in range(9):
	rad = 50+teller*5  # equivalent to adding 5 to 50 each time
	canv.drawOval(teller*50, (teller**2)*5, rad, rad)
	# adding 40 to x_pos is equivalent to mulitplying by the number of times we've added it
	# this is also equivalent to `teller * 50`. 

	# y_pos follows nothing else than an arbritrary exponential function

win.wait()