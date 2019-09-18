#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
	This program is made as a solution to activity 5 of the 4th assignment of
	IN1000 at UiO, fall 2019.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "15th September 2019"

def count_letters(my_str: str, only_words=False) -> int:
	assert not only_words or len(my_str.split()) == 1 # ensuring only one word being allowed if case

	counter = 0
	for char in my_str:
		if ord(char) in range(97, 123) or ord(char) in range(65, 91):  # range 65-90 A-Z, 97-122 a-z
			counter += 1
		else:
			pass  # not a letter
	return counter

def count_words(my_str: str) -> dict:
	import re
	str_list = re.split(r"([,.!; ])", my_str) # stripping grammatical symbols
	str_list = [item for item in str_list if item != ""]  # rremoving empty strings inbetween delimiters
	#print(str_list)

	word_dict = dict()
	for word in str_list:
		if word not in word_dict.keys():
			word_dict[word] = 1
		else:
			word_dict[word] += 1

	return word_dict

def analyse_text(my_str: str) -> None:
	word_dict = count_words(my_str)
	for word in word_dict.keys():
		w_letters = count_letters(word)
		word_dict[word] = [word_dict[word], w_letters]

	print(f"I found {len(word_dict)} words in your sentence.")

	print(f"{'Words':<10}{'Times':>10}{'Letters':>10}\n")
	for word, values in word_dict.items():
		print(f"{word:<10}{values[0]:>10}{values[1]:>10}")


# sample data
# print(count_letters("hellow or!!!!d", only_words=False))
# print(count_letters("hellowor!!!!d", only_words=True))  # disallows newlines and spaces
# print(count_words("hello world I love you world"))
# analyse_text("I love you very, very much!!")
# print("\n")

analyse_text(input("Give me a sentence!\n"))

