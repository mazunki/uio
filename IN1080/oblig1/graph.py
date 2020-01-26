import matplotlib.pyplot as plt
import numpy as np

plt.subplots_adjust(top=0.9, bottom=0.1, hspace=1.3)

plt.subplot(2,1,1)
plt.plot([47, 1000, 470000], [4.92, 5.0055, 5.0083], "o-")
plt.axis([20, 600000, 4.8, 5.2])
plt.xscale("log")
plt.ylabel('Voltage (v)')
plt.xlabel(u'Resistance (\u2126)')
plt.grid(True, which="both")
plt.title("V/R relation")

intensity_from_resistance = lambda r: 5/r

x1 = np.linspace(1000, 100000, num=100)

plt.subplot(2,1,2)
plt.plot(x1, intensity_from_resistance(x1))
plt.axis([20,600000,0.0,0.006])
plt.ylabel("Intensity (A)")
plt.xlabel(u"Resistance (\u2126)")
plt.xscale("log")
plt.grid(True, which="both")
plt.title("I/R relation")


plt.show()
