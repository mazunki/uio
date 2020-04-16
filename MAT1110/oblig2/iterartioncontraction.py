import matplotlib.pyplot as plt
import numpy as np

f = lambda x,y: np.array([5*x-x*y-y**2+1, 5*y-x**3+y**2-3])

def next_iter(last_val):
	x_n, y_n = last_val

	jacobi = np.array([	[5-y_n,			x_n-2*y_n	],
						[3*(x_n**2),	5+2*y_n		]	])
	inv_jac = np.linalg.inv(jacobi)

	return last_val - inv_jac @ f(x_n, y_n)

def iterate(start_x, start_y, times):
	X, Y = [start_x], [start_y]
	val = np.array([start_x, start_y])
	
	for _ in range(times):
		val = next_iter(val)
		print(val)
		X.append(val[0])
		Y.append(val[1])
	plt.plot(X, Y, label=f"start: ({start_x}, {start_y})")
	X.clear()
	Y.clear()

iterate(0,0,15)
iterate(-1,1,15)
plt.legend()
plt.savefig("iteration.png")
plt.show()