"""

"""


INPUT_NAME = "Skriv inn navn: "
INPUT_LOCATION = "Hvor kommer du fra? "


def ask_name_place():
	name = input(INPUT_NAME)
	location = input(INPUT_LOCATION)
	print(f"Hei, {name}! Du er fra {location}")

if __name__ == '__main__':
	ask_name_place()  # Activity 1.1

	# Activity 1.2
	for _ in range(3):
		ask_name_place()