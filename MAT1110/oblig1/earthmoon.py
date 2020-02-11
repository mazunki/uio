import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d as Axes3D
from math import tau, cos, sin
import numpy as np

# CONSTANTS
r_m, r_j = 10, 150  # fake moon radius for visual aspect
# r_m = 0.384  # real value
T_m, T_j = 27.3, 365
w_m, w_j = tau / T_m, tau/T_j

# earth formulas relative to sun
r1_x = lambda t: r_j * cos(w_j * t)
r1_y = lambda t: r_j * sin(w_j * t)
r1 = lambda t: (r1_x(t)**2 + r1_y(t)**2)**(0.5)
# moon formulas relative to earth
r2_x = lambda t: r_m * cos(w_m * t)
r2_y = lambda t: r_m * sin(w_m * t)
r2 = lambda t: (r2_x(t)**2 + r2_y(t)**2)**(0.5)
# moon formulas relative to sun
r_x = lambda t: r1_x(t) + r2_x(t)
r_y = lambda t: r1_y(t) + r2_y(t)
r = lambda t: (r_x(t)**2 + r_y(t)**2)**(0.5)

# sample points on time axis
times = np.arange(0, 365, step=0.1)
# earth values
xs_r1 = [r1_x(t) for t in times]
ys_r1 = [r1_y(t) for t in times]
# moon values 
xs_r2 = [r2_x(t) for t in times]
ys_r2 = [r2_y(t) for t in times]
# absolute moon values
xs_r = [r_x(t) for t in times]
ys_r = [r_y(t) for t in times]

# 3d figure with orthogonal projection
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d',proj_type="ortho")
ax.set_xlabel('Time axis')
ax.set_ylabel('X axis')
ax.set_zlabel('Y axis')
ax.view_init(elev=30, azim=-30)

# adding all three formulas (moon, earth, absolute moon)
ax.scatter(times, xs_r,  ys_r,  s=1) # absolute moon
ax.scatter(times, xs_r1, ys_r1, s=1) # earth to sun
ax.scatter(times, xs_r2, ys_r2, s=1) # moon to earth

# fullscreen
figManager = plt.get_current_fig_manager()
figManager.window.showMaximized()

plt.show()
