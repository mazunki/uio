import matplotlib.pyplot as plt
import numpy as np

plt.subplot(2,1,1)
plt.plot([47, 1000, 470000], [4.92, 5.0055, 5.0083], "o-")
plt.axis([20, 600000, 4.8, 5.2])
plt.xscale("log")
plt.ylabel('Voltage (v)')
plt.xlabel(u'Resistance (\u2126)')
plt.grid(True, which="both")
plt.title("V/R relation")

intensity_from_resistance = lambda r: 5/r

x1 = np.logspace(1000, 100000, 1000)

plt.subplot(2,1,2)
plt.plot(x1, intensity_from_resistance(x1))
plt.xlabel("Intensity (A)")
plt.ylabel(u"Resistance (\u2126)")

plt.show()
