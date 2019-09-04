#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 4 of the 3rd assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "4th September 2019"


def get_a_food_schedule(patient:str=None) -> None:  # Activity 5.2
	while patient not in food_patient_dict.keys():
		if patient is not None:
			print("Hm... couldn't find that patient... try again.")
		patient = input("Who do you want to check? ")

	else:
		print(	f"Breakfast: {food_patient_dict[patient][0]}\n"\
				f"Lunch: {food_patient_dict[patient][1]}\n"\
				f"Dinner: {food_patient_dict[patient][2]}"
			)


# Activity 4.1
food_patient_dict = {
	"mazunki": ["Pizza", "Ice cream", "Jelly"],  # very much healthy
	"Rolf Vidar": ["Oat milk", "Spaghetti", "Cookies"],
	"Michelle": ["Banana smoothie", "Spaghetti", "Toast"]
}

if __name__ == '__main__':
	get_a_food_schedule()  # sample

###
# Activity 4.3
# First off, I would like to say that this whole exercise is utterly confusing. It makes no sense to store data
# this way, considering we have classes which literally have the role of creating objects with a blueprint
# Storing values based on a position in a list, when we could just have instances of a Patient class with variables
# assigned to them instead... just makes no sense, and is confusing both for a programmer and a reader.
# The same goes for functions. These should be part of this Patient class, callable on a per-patient instance.

# Having said that, and reminding us about GDPR and privacy precautions:

# a) Usernames should always be unique. We should store identifiers with UUIDs, not raw usernames, for the sake of
# unique identity, integrity, and anonimity. Excluding that... usernames are strings. They should be stored in a
# database, such as SQL, and be interpreted in its tableform. Use these in a class, or a dictionary. If you need to
# do some operations on all users, you'll want to be able to know who we're refering to. If we have a class objects for
# the user, we can just store these in a set (as order is most likely irrelevant for this type of data). Otherwise, store
# a dictionary of all usernames/UUIDs as keys, and a list of all their resspective data stored sequentally as it's value.
# If only the usernames are required for some reason, without its corresponding data, store these in a list.

# b) If we need to use this, which isn't a safe thing to store in one single point for more than a single process,
# considering the security matters involving storing them (users can access this and alter it, leaks can happen...),
# we should create a dictionary where each test defines a username-score pair. 

# c) These would be stored in a list.

# d) If we want to make the same dish for everyone, we only need one list. If we want to make a special dish for everyone, or just
# remove the allergenes from the required plates... use a dictionary for all members. Members that don't have allergies
# could be excluded.

# Sorry about the ranting. 
###