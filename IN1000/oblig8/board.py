from cell import * 
import random


class Board(list):
	def __init__(self, x_size, y_size, generator="random", fg=None):

		self.rows = list()
		for i in range(y_size):
			cells = Row()
			for j in range(x_size):
				new_cell = Cell(x=i, y=j, parent=self, alive=self.cell_generator(generator,i,j,fg))  # appending coordinates to calculate with generator
				cells.append(new_cell)
			self.rows.append(cells)
		
		# we want to be able to access the rows of the board as if it were the main target of the object
		super().__init__(self.rows)
		
		self.all_cells = [cell for row in self.rows for cell in row]

		# After generating all cells we can update the neighbours, as they now exist
		for row in self.rows:
			for cell in row:
				cell.get_neighbours()

	def next_generation(self):
		to_revive = list()
		to_kill = list()

		for cell in self.all_cells:
			if cell.alive:
				if cell.find_life() < 2:
					to_kill.append(cell)
				elif cell.find_life() > 3:
					to_kill.append(cell)
			else:
				if cell.find_life() == 3:
					to_revive.append(cell)

		for cell in to_revive:
			cell.revive()
		for cell in to_kill:
			cell.kill()
		for cell in self.all_cells:
			if cell not in to_kill and cell not in to_revive:
				cell.prolong_life()

	@staticmethod
	def cell_generator(method,x=0,y=0,fg=None):
		if method=="random":
			return random.choice([True, False, False])
		elif method=="fill":
			return True
		elif method == "custom":
			try:
				if fg[x][y].lower()=="o":
					return True
				elif fg[x][y].lower()=="x":
					return False
				else:
					return False   # empty commas
			except IndexError:
				return False  # False for lines that are out of defined range
		elif method == "chess":
			return bool((x+y)%2)
		else:
			return False

	def still_running(self):
		for cell in self.all_cells:
			if cell.old_state != cell.alive:
				return True
		#return False

	def __str__(self):
		return "\n".join([str(row) for row in self]) + "\n"

	def __repr__(self):
		return "\n".join([repr(row) for row in self]) + "\n"