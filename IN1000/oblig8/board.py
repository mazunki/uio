from cell import * 
import random


class Board(list):
	def __init__(self, x_size, y_size, generator="random"):
		

		self.rows = list()
		for i in range(x_size):
			cells = Row()
			for j in range(y_size):
				new_cell = Cell(x=i, y=j, parent=self, alive=self.cell_generator(generator,i,j))
				cells.append(new_cell)
			self.rows.append(cells)
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
	def cell_generator(method,x=0,y=0):
		if method=="random":
			return random.choice([True, False, False])
		elif method==True:
			return True
		elif method == "manual":
			return 0
		elif method == "custom":
			return True
		elif method == "chess":
			return bool((x+y)%2)
		else:
			return False

	def __str__(self):
		return "\n".join([str(row) for row in self]) + "\n"

	def __repr__(self):
		return "\n".join([repr(row) for row in self]) + "\n"