#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 1 of the 3rd assignment of
	IN1000 at UiO, fall 2019.
"""


def number_list() -> list:
	""" Creates a list, and prints the first and third elements, returning its list """
	list_of_numbers = [1, 3, 5]
	list_of_numbers.append(7)
	print(list_of_numbers[0], list_of_numbers[2])  # first and third elements

	return list_of_numbers


def name_list():
	""" Creates an empty list, and asks the user to provide four names. Returns the final list """
	second_list = list()
	for _ in range(4):
		second_list.append(input("Gi meg et navn: "))

	return second_list


def name_in_list(item:str, lst):
	if item in lst:
		print("Du husket meg!")
	else:
		print("Glemte du meg?")


def prod(lst:iter) -> int:
	""" Analogous to the built-in `sum(iterable)`, 
		returns the value resulting in multiplying all items
		in an iterable. """ 

	p = 1  # product starts at 1
	for item in lst:
		p *= item

	return p


def operations_on_list(lst:iter) -> None:
	"""
		Does a series of operations on the given list. 
		First, it calculates the total product using all the values from the list, and
		the same for the sum. Then it prints a new list using these two extra values, and
		then prints another list which yields the same list that was inputted. 
	"""
	lst_product = prod(lst)
	lst_sum = sum(lst)
	new_list = list((lst_product, lst_sum))
	newer_list = lst + new_list
	print(newer_list)
	newer_list = newer_list[:-2]
	print(newer_list)


if __name__ == '__main__':
	list_1 = number_list()  # Activity 1.1
	list_2 = name_list()  # Activity 1.2
	name_in_list("mazunki", list_2)  # Activity 1.3 (`mazunki` is my name)
	operations_on_list(list_1)  # Activity 1.4
