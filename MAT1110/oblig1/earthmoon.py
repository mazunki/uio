import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d as Axes3D

from math import pi, tau, cos, sin
import numpy as np


r_m = 0.384
T_m = 27.3
w_m = tau / T_m
r_j = 150
T_j = 365
w_j = tau / T_j

r1_x = lambda t: r_j * cos(w_j * t)
r1_y = lambda t: r_j * sin(w_j * t)
r2_x = lambda t: r_m * cos(w_m * t)
r2_y = lambda t: r_m * sin(w_m * t)

r_x = lambda t: r1_x(t) + r2_x(t)
r_y = lambda t: r1_y(t) + r2_y(t)

times = np.arange(0, 3650, step=0.5)

xs_r = [r_x(t) for t in times]
ys_r = [r_y(t) for t in times]

xs_r1 = [r1_x(t) for t in times]
ys_r1 = [r1_y(t) for t in times]

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.scatter(times, xs_r,  ys_r,  s=1)
ax.scatter(times, xs_r1, ys_r1, s=1)

ax.set_xlabel('Time axis')
ax.set_ylabel('X axis')
ax.set_zlabel('Y axis')

plt.show()
