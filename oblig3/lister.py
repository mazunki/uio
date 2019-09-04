"""
	This program is made as a solution to activity 1 of the 3rd assignment of
	IN1000 at UiO, fall 2019.
"""


def number_list():
	list_of_numbers = [1, 3, 5]
	list_of_numbers.append(7)
	print(list_of_numbers[0], list_of_numbers[2])  # first and third elements

	return list_of_numbers


def name_list():
	second_list = list()
	for _ in range(4):
		second_list.append(input("Gi meg et navn: "))

	return second_list


def name_in_list(item, lst):
	if item in lst:
		print("Du husket meg!")
	else:
		print("Glemte du meg?")


def prod(lst):
	p = 1  # start
	for item in lst:
		p *= item

	return p


if __name__ == '__main__':
	main()