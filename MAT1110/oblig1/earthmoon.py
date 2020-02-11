import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d as Axes3D

from math import pi, tau, cos, sin
import numpy as np


r_m = 1
#r_m = 0.384
T_m = 27.3
w_m = tau / T_m
r_j = 150.0
T_j = 365.0
w_j = tau / T_j

print(r_m, T_m, w_m)
print(r_j, T_j, w_j)

r1_x = lambda t: r_j * cos(w_j * t)
r1_y = lambda t: r_j * sin(w_j * t)
r2_x = lambda t: r_m * cos(w_m * t)
r2_y = lambda t: r_m * sin(w_m * t)

r_x = lambda t: r1_x(t) + r2_x(t)
r_y = lambda t: r1_y(t) + r2_y(t)

times = np.arange(0, 365, step=0.1)

xs_r = [r_x(t) for t in times]
ys_r = [r_y(t) for t in times]

xs_r1 = [r1_x(t) for t in times]
ys_r1 = [r1_y(t) for t in times]

xs_r2 = [r2_x(t) for t in times]
ys_r2 = [r2_y(t) for t in times]

#print(*zip(xs_r2, ys_r2))

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d',proj_type="ortho")

ax.scatter(times, xs_r,  ys_r,  s=1)
ax.scatter(times, xs_r1, ys_r1, s=1)
#ax.scatter(times, xs_r2, ys_r2, s=1)

ax.set_xlabel('Time axis')
ax.set_ylabel('X axis')
ax.set_zlabel('Y axis')
ax.view_init(elev=0, azim=0,)

figManager = plt.get_current_fig_manager()
figManager.window.showMaximized()

ax.margins(x=0, y=-0.25) 
plt.show()
