#!/usr/bin/env python3

"""
	Residents of the major cities in some region of the world in the shortest time possible, is faced with the problem of finding the shortest tour among the cities. A tour is a path that starts in one city, visits all of the other cities, and then returns to the starting point.

	The relevant pieces of information, then, are the cities and the distances between them. In this instance of the TSP, a number of European cities are to be visited. Their relative distances are given in the data file, european_cities.csv, found in the zip file with the mandatory assignment.

"""

import csv
import numpy as np
import random
from itertools import permutations, combinations

import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import data

import collections
import timeit

print_ = print
def print(*args, **kwargs):
	from pygments import highlight, lexers, formatters
	for arg in args:
		if isinstance(arg, dict):
			import json
			arg = { (str(k) if not isinstance(k, tuple) else "<"+",".join(str(item)[:3] for item in k) + ">"): v for k,v in arg.items() }
			the_string = json.dumps(arg, indent='\t')
		else:
			the_string = str(arg)
		string_fmt = highlight(
				the_string,
				lexers.Python3Lexer(),
				formatters.TerminalFormatter()
				)
		print_(string_fmt, end="")

## Comment this line for beautiful stuff
print = print_


class Salesman:
	"""
		A class to do the Travelling Salesman problem.
		Attributes:
			self.city_coords: { city: (x, y) }
			self.distance_data: dict[city][city]
			self.fig: matplotlib.pyplot
			self.m: mpl_toolkits.basemap.Basemap
			self.cities_filename: str
			self.cities: list[city]
	"""
	def __init__(self, city_coords, plot_size, max_cities=None, verbose=False, timings=True):
		self.verbose = verbose
		self.timings = timings
		self.funcmap = {"Exhaustive Search": self.exhaustive_search, "Hill Climbing": self.hill_climbing, "Genetic Algorithm": self.genetic_algorithm}

		data_ = self.read_data_("european_cities.csv", city_coords )
		self._cities, self.distance_data, self.city_coords = data_
		self._cities = tuple(self._cities)
		self.fig, self.plots = plt.subplots(*plot_size, figsize=(8, 8))
		self.maps = {}

		print(f"{self._cities=}")
		if self.verbose: print(f"{self.distance_data=}")


	def read_data_(self, filename, city_coords):
		"""
			Returns a tuple to be used to assign self.cities, self.distance_data, self.city_coords
			If cities_used is set, max_cities is ignored. If neither is set, all cities are used.
		"""
		with open(filename, "r") as f:
			data_ = list(csv.reader(f, delimiter=';'))
			cities_ = data_.pop(0)

		# we making a two-way matrix form the csv file for dict access. easy distance lookup :)
		# hurr durr O(n²)
		distance_data = {
				start_city: {
					end_city: float(data_[start][end])
					for end, end_city in enumerate(cities_)
					}
				for start, start_city in enumerate(cities_)
				}
		# city_coords = { k: v for k, v in city_coords.items() if k in cities }
		return cities_, distance_data, city_coords

	def time_it(self, func, number=10, *args, **kwargs):
		def wrapper(func, *args, **kwargs):
			def wrapped():
				return func(*args, **kwargs)
			return wrapped
		t = timeit.timeit(wrapper(func, *args, **kwargs), number=number)
		print(f"Called function {number} times. Took {t/number:.2f}s on average!")



	def start(self):
		if self.timings: self.time_it(self.func)
		plt.show()

	def stroke_line(self, start, end):
		self.current_axis.plot(*list(zip(start, end)))

	def mark_point(self, coords, label=""):
		self.current_axis.plot(*coords, 'ok', markersize=2)
		self.current_axis.text(*coords, label, fontsize=8)

	def plot_figure(self):
		self.maps[self.current_axis] = Basemap(projection='lcc', resolution=None,
				width=4E6, height=3E6, 
				lat_0=49, lon_0=13, ax=self.current_axis)

		# Basemap.etopo() returns a clipping input data warning... dunno how to fix
		self.maps[self.current_axis].etopo(scale=0.5, alpha=0.5)

		# Map (long, lat) to (x, y) for plotting
		for city,location in self.city_coords.items():
			if city in self.cities:
				x, y = self.maps[self.current_axis](*location)
				self.mark_point((x, y))
				self.current_axis.text(x, y-100000, city, fontsize=6)

	def plot_plan(self, ordered_cities):
		# Map (long, lat) to (x, y) for plotting
		current = None, None
		for count, city in enumerate(ordered_cities):
			last = current

			current = self.maps[self.current_axis](*self.city_coords[city])
			last = last if any(last) else current

			self.stroke_line(start=last, end=current)
			self.mark_point(current, label=count+1)

		first = self.maps[self.current_axis](*self.city_coords[ordered_cities[0]])
		self.stroke_line(start=current, end=first)

	def run_new_algorithm(self, plot_x, plot_y, algorithm, max_cities=None, cities_used=None):
		if cities_used:
			cities = cities_used
		elif max_cities:
			cities = random.sample(self._cities, max_cities)
		else:
			cities = self._cities
		self.cities = cities

		self.current_axis = self.plots[plot_y][plot_x]
		self.current_axis.set_title(f"{algorithm} with {max_cities} cities")
		self.plot_figure()  # empty canvas
		self.shortest, self.longest = self.funcmap[algorithm]()
		self.plot_plan(self.shortest)
		self.current_axis.set_xlabel(f"Distance: {self.total_distance(self.shortest)}")
		print(f"Plotted {self.shortest}")


	def distance_between(self, start, end):
		d = self.distance_data[start][end] 
		# print("Distance between {0:20}: {1:2}".format(f"{start}­{end}", d))
		return d

	def total_distance(self, route):
		route_total_distance = sum(self.distance_between(prev, curr) for (prev, curr) in zip(route, route[1:])) if route else float("inf")
		# print(f"td={route_total_distance}: {route}")
		return round(route_total_distance, 2)  # to avoid ieee754 microerrors


	def exhaustive_search(self):
		""" 
			Performs an exhaustive of all the permutations of self.cities, including rotations of the tuple,
			in an attempt to find the shortest and longest paths.

			Due to the nature of permuting a tuple, this function will grow by a factorial factor!, thus
			we will see a O(n!) growth rate in the time it takes which is incredibly slow. It wouldn't be
			trivial to thread it either... not that it would help much.
		"""
		self.algorithm_name = "Exhaustive Search"

		self.route_distances = {}
		shortest_distance = float("inf")
		longest_distance = float("-inf")

		for route in permutations(self.cities):
			try:
				route_total_distance = self.total_distance(route)
				self.route_distances[route_total_distance] = route

				shortest_distance = min(route_total_distance, shortest_distance)
				if shortest_distance == route_total_distance:
					shortest_path = route

				longest_distance = max(route_total_distance, longest_distance)
				if longest_distance == route_total_distance:
					longest_path = route
			except KeyboardInterrupt:
				break

		sorted_paths = dict(sorted(self.route_distances.items()))
		print(f"Found {len(sorted_paths)} different paths!")
		print(f"{shortest_distance=}: {shortest_path=}\n{longest_distance=}: {longest_path=}")
		return shortest_path, longest_path

	def hill_climbing(self):
		""" Performs a search through the usage of a hill climbind algorithm """
		self.algorithm_name = "Hill Climbing"

		def next_generation(old_path, log=False):
			candidate = list(old_path[:]) if old_path else list(self.cities[:])
			for left, right in combinations(range(0, len(candidate)), r=2):
				candidate[left], candidate[right] = candidate[right], candidate[left]
				yield candidate

		best_of_generation = None
		bored = False
		while not bored:
			bored = True

			improved_candidates = []
			for candidate in next_generation(best_of_generation):
				if self.total_distance(candidate) < self.total_distance(best_of_generation):
					bored = False
					improved_candidates.append(candidate[:])
					# print(f"Found improvement! From {self.total_distance(best_of_generation)}, to td={self.total_distance(candidate)}: {candidate}")

			if not bored:
				print(f"There are {len(improved_candidates)} winners!")
				best_of_generation = min(improved_candidates, key=self.total_distance)
			print(f"This generation ended at td={self.total_distance(best_of_generation)}: {best_of_generation}")


		return best_of_generation, None # shortest, longest



	def genetic_algorithm(self):
		"""
			Performs a search through a genetic algorithm
			We always keep the 2 best routes.
			Additionally, we mate 50% of the elite of the last generation.
			The rest appear by the arts of magic.

			Generations will keep appearing until the average of total distances
			of the top candidates stops growing
		"""
		self.algorithm_name = "Genetic Algorithm"

		def incubate(parent_a, parent_b):
			"""
				Uses the PMX algorithm to return two children
				Source: https://rubicite.com/Tutorials/GeneticAlgorithms/CrossoverOperators/PMXCrossoverOperator.aspx
			"""
			swath_start, swath_end = sorted(random.sample(range(len(parent_a)), 2))
			child = [ parent_a[i] if i in range(swath_start, swath_end) else None for i in range(len(parent_a)) ]

			for i, value in enumerate(parent_b[swath_start:swath_end], start=swath_start):
				while value not in child:
					other_partner_value = parent_a[i] 
					position_of_value_in_partner_b = parent_b.index(other_partner_value)
					if position_of_value_in_partner_b in range(swath_start, swath_end):
						value = other_partner_value
					else:
						child[position_of_value_in_partner_b] = value

			for i, value in enumerate(parent_b):
				child[i] = value

			return tuple(child)

		# I have no idea how to properly tune these values, to be honest
		max_population = 500
		unalive_after_bored_generations = 1000
		elite_population = 10
		breeding_population = min(round((max_population-elite_population) * 70), max_population)

		generation = { tuple(random.sample(self.cities, len(self.cities))) for _ in range(max_population) }
		generation = { k: self.total_distance(k) for k in generation }
		score = sum(sorted(generation.values())[:elite_population+breeding_population])//max_population

		bored_generations = 0
		while bored_generations < unalive_after_bored_generations:
			new_generation = {}
			sorted_old_gen = sorted(generation.keys(), key=lambda parent: generation[parent])

			# elitism
			for parent in sorted_old_gen[:elite_population]:
				#		sorted_old_gen.pop(0)  # we don't want capitalism to take over the world. kinda avoids local maxima issues, at the cost of more generatios needed
				new_generation[parent] = self.total_distance(parent)

			# breeding
			newly_bred = 0
			while newly_bred < breeding_population:
				lucky_parents = random.sample(sorted_old_gen, 2)  # yes, parents can have multiple partners, and children with others. :)
				# print(f"{lucky_parents=}")
				offspring = incubate(*lucky_parents)
				new_generation[offspring] = self.total_distance(offspring)
				newly_bred += 1

			# random offspring
			while len(new_generation) < max_population:
				stork_offspring = tuple(random.sample(self.cities, len(self.cities)))
				if stork_offspring not in new_generation.keys():
					new_generation[stork_offspring] = self.total_distance(stork_offspring)


			bored_generations += 1
			generation = new_generation
			generation_score = sum(sorted(generation.values())[:elite_population+breeding_population])//max_population
			if generation_score < score:
				# print(f"{new_generation=}")
				print(f"From {score=} to {generation_score=}")
				bored_generations = 0
				score = generation_score
			else:
				# print(f"This was a waste of a generation :( Had {score=}, have {generation_score=}")
				pass


		return min(new_generation.items(), key=lambda k: new_generation[k[0]])[0], None




if __name__ == "__main__":
	algos = {
			"Exhaustive Search": (6, 10),
			"Hill Climbing": (10, 24),
			"Genetic Algorithm": (10, 24)
			}
	ts = Salesman(data.cities_coords, plot_size=(2, 3), timings=False, verbose=False)

	for plot_x, algorithm, in enumerate(algos):
		for plot_y, city_number in enumerate(algos[algorithm]):
			ts.run_new_algorithm(plot_x, plot_y, algorithm, city_number)

			print(f"ALGORITHM {algorithm} with {city_number} cities FINISHED with {ts.total_distance(ts.cities)}", end="\n\n")
	ts.start()

