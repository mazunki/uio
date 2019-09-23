#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 5 of the 5th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "19th September 2019"

FIB_FILE = "fibonacci.txt"
fib_list = list()

def update_fiblist(in_:str=FIB_FILE, out_:list=fib_list) -> None:
	"""
		Reads values from a file and stores it in the list.
	"""

	try:
		with open(in_, "r") as f:
			fib_list = [int(f) for f in f.read().split()]
	except FileNotFoundError:
		return False	

def save_fiblist(in_:list=fib_list, out_:str=FIB_FILE) -> None:
	"""
		Reads values from list, and stores them in file.
	"""
	with open(out_, "w+") as f:
		f.write("\n".join([str(f) for f in fib_list]))

def get_fib(F:list=fib_list) -> int:
	"""
		Returns the next Fibonacci sequence for the given sequence.
	"""
	if len(F) >= 2:
		return F[-1]+F[-2]
	else:
		return 1

if __name__ == '__main__':
	print("Reading...")
	update_fiblist()
	print("Calculating!")
	try:
		while True:
			fib_list.append(get_fib())
			#print(fib_list[-1])

	except KeyboardInterrupt:
		save_fiblist()
		print("Saved!")