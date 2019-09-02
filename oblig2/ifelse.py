"""
	This program is made as a solution to activity 5 of the 2nd assignment of
	IN1000 at UiO, fall 2019.

	The idea is to input a number, and output a list of types of numbers that this number is True for.
	This list includes prime/composite numbers, Fibonacci numbers, Odd/Even, and Happy/Sad numbers.
"""
__author__ = "Rolf Vidar Hoksaas"
__email__ = "rolferen@gmail.com"
__date__ = "2nd September 2019"

def is_prime(x:int):
	if x == 0:  # trivial cases
		return False
	elif x == 1:
		return True

	elif isinstance(x, int):
		upper_bound = int( round(x ** (1/float(x)) ) )+1	# no numbers above the sqrt() of the number are needed,
															# casting to int for Python2, adding 1 because of round()

		for i in range(3, upper_bound+1):  # adding 1 because of how Python handles ranges
			if (x % i) == 0:
				return False
		else:  # if no numbers up to boundary are composite, it must be prime
			return True

	else:
		if (x % 1) == 0:
			x = int(x)
			return is_prime(x)  # rounding int-like floats to int (3.0, or 0.0)

		else:
			raise ValueError  # unsupported input


def is_Fibonacci(x:int):
	if x == 1:  # trivial case
		return True

	elif isinstance(x, int):
		f = [1,1]
		while min(f) < x:
			# updating both n-1 and n-2, in sequence
			f[0] = sum(f)
			f[1] = sum(f)

			if x in f:
				return True
		else:
			return False

	else:
		raise ValueError  # unsupported value


def is_even(x:int):
	if isinstance(x, int):
		return x%2 == 0
	else:
		return ValueError

def is_happy(x:int, tried_values:list=[]):
	#print("round", x, "with", tried_values)
	if isinstance(x, int):
		sum_digits_squared = 0
		for digit in str(x):  # the string of an int is iterable!
			sum_digits_squared += int(digit)**2
		
		if sum_digits_squared == 1:
			tried_values.clear()  # lists are referential! must clear it before final return!
			return True
		else:
			if sum_digits_squared in tried_values:
				tried_values.clear()
				return False
			tried_values.append(sum_digits_squared)

			return is_happy(sum_digits_squared, tried_values=tried_values)

	else:
		return ValueError

def find_states(x:int):
	list_x = list()
	if is_even(x):
		list_x.append("even")
	else:
		list_x.append("odd")
	if is_prime(x):
		list_x.append("prime")
	elif x != 0:
		list_x.append("composite")
	if is_happy(x):
		list_x.append("happy")
	else:
		list_x.append("sad")
	if is_Fibonacci(x):
		list_x.append("Fibonacci")

	return ", ".join(list_x[:-1]) + f", and {list_x[-1]}"

for i in range(0, 501):
	print(i, "is", find_states(i), end=".\n")