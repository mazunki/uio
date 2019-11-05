import random, time, sys
from board import *
from cell import *

def init():
	try:
		if "--size" not in sys.argv:
			x = int(input("Width: "))
			y = int(input("Height: "))
		else:
			x = int(sys.argv[sys.argv.index("--size")+1])
			y = int(sys.argv[sys.argv.index("--size")+2])
	except ValueError:
		print("Size must be numeric!")
		quit()

	if "--generator" not in sys.argv:
		generator = "random"
	else:
		try:
			generator = sys.argv[sys.argv.index("--generator")+1]
			assert generator in ["random", "manual", "custom", "chess"], generator
		except AssertionError:
			print(f"`{generator}` isn't a valid generator.")
			quit()


	return Board(x_size=x, y_size=y, generator=generator)


def main():
	my_board = init()
	i = 0

	try:
		stop = False
		while not stop:
			if "--auto" not in sys.argv:
				stop = input(f"Generation: {i}. Press enter to continue.")
			else:
				time.sleep(0.3)
				print(f"Generation {i}")
				stop = False

			if "-v" in sys.argv:
				print(repr(my_board))
			else:
				print(my_board)
		
			my_board.next_generation()
			i += 1

	except KeyboardInterrupt:
		quit()

if __name__ == '__main__':
	
	if not "--help" in sys.argv and not "-h" in sys.argv:
		main()
	else:
		print("Use -v to print verbose information. Use -h to print this.")