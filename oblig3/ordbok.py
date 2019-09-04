#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 2 of the 3rd assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "4th September 2019"

def add_store_item(inventory:dict) -> dict:
	""" Asks the user for the name of a product to add to the inventory lists, 
	and adds the requested item to the dictionary. 

	Although `item` and `quantity` are in the local scope, we're appending values to the
	dictionary outside of the local scope, so we don't need to call `global` to edit it.
	"""

	item = input("What are we adding to the list? ")
	quantity = float(input("And how many/much of this item (numerical form)? "))

	# If item is already in list, just sum it to the pool instead of overwriting it.
	# Allows negative values if user wants to set to zero.
	if item in inventory.keys():  
		inventory[item] += quantity
	else:
		inventory[item] = quantity


if __name__ == '__main__':
	my_shop_inventory = {
		"melk": 14.90,
		"yoghurt": 12.90,
		"pizza": 39.90
	}  # JSON style because we're awesome

	print(my_shop_inventory)

	for _ in range(2):
		add_store_item(my_shop_inventory)

	print(my_shop_inventory)