#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 5 of the 5th assignment of
	IN1000 at UiO, fall 2019.

	The idea is to use a file to store Fibonacci numbers to, 
	so that these can be used to calculate more Fibonacci numbers when desired.

	Use `sed -n "N p" fibonacci.txt` to print the desired Fibonacci number, where
	N is the Nth Fibonacci number. Outputs nothing if the number is not in the list yet.

	Use `wc -l fibonacci.txt` to print the amount of Fibonacci numbers found.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "29th September 2019"

import time
STACK = 1e3+2  # be careful not to go crazy here. 1e4 is already slow for me.
FIB_FILE = "fibonacci.txt"
fib_list = list()

def update_fiblist(in_:str=FIB_FILE) -> None:
	"""
		Reads values from a file and stores it in the list.
	"""
	global fib_list

	try:
		with open(in_, "r") as f:
			fib_list = [int(f) for f in f.read().strip().split()]
		
		print("Current number of Fibonacci numbers:", len(fib_list))
		if len(fib_list) < 3:
			fib_list = [0, 0, 0, 1]
		else:
			fib_list = fib_list[-2:]

	except FileNotFoundError:
		fib_list = [0, 0, 0, 1]

	# print("Current state of F:", fib_list)

def save_fiblist(in_:list, out_:str=FIB_FILE, end=False) -> None:
	"""
		Reads values from list, and stores them in file.
	"""
	global fib_list

	with open(out_, "a") as f:
		f.write("\n".join([str(f) for f in in_[2:]]))
		if not end:
			f.write("\n")

	
	#print(in_)
	print(f"Saved {len(in_[2:])} Fibonacci numbers.")
	
	fib_list = in_[-2:]

def get_fib(F:list) -> int:
	"""
		Returns the next Fibonacci sequence for the given sequence.
	"""
	return F[-1]+F[-2]

if __name__ == '__main__':
	print("Reading...")
	update_fiblist()
	print("Calculating!")
	try:
		while True:
			if len(fib_list) >= STACK:
				save_fiblist(fib_list)
				#print("Saved!")
				# time.sleep(0.3)  # let's not break anyone's computer... for now
			else:
				fib_list.append(get_fib(fib_list))

	except KeyboardInterrupt:
		save_fiblist(fib_list, end=True)
		print("Done!")
		print("Currently got", sum(1 for _ in open(FIB_FILE)), "numbers.")