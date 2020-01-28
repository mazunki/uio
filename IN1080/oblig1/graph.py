import matplotlib.pyplot as plt
import matplotlib.ticker as tkr
import matplotlib.axis as ax
import numpy as np

plt.subplots_adjust(top=0.9, bottom=0.1, hspace=1.3)

# Ex. 9
"""
plt.plot([47, 1000, 470000], [4.92, 5.0055, 5.0083], "o-")
plt.axis([20, 600000, 4.8, 5.2])
plt.xscale("log")
plt.ylabel('Voltage (v)')
plt.xlabel(u'Resistance (\u2126)')
plt.grid(True, which="both")

#plt.savefig('relvoltohm.png')
"""

# Ex. 11

def format_data(self, value):
	return  '%1.10e' % value/1000

plt.xlabel(u'Resistance $R_s$ (\u2126)')
plt.ylabel(u'Current $R_s$ (mA)')

plt.grid(True, which="both")
plt.title("Current/Resistance relation")

intensity_from_resistance = lambda r: 1000 * 5/r 
x1 = np.linspace(1000, 100000, num=100000)
plt.grid(True, which="both")

plt.plot(x1, intensity_from_resistance(x1), label=u"$R_l$ = 19k\u2126")
plt.legend()

# Ex. 13

current_from_resistance = lambda r: 1000 * (100 / (r + 19000))

plt.plot(x1, current_from_resistance(x1), label=u"$R_l$ = 1k\u2126")
plt.axis([20,100000,0.0,6]) 

plt.legend()
plt.savefig('variableresistor.png')


# Ex. 14

current_from_resistance = lambda r: 1000 * (100 / (r + 200e3))

plt.plot(x1, current_from_resistance(x1), label=u"$R_l$ = 200k\u2126")
plt.axis([20,100000,0.0,6])
plt.legend()

plt.savefig('bigvariableresistor.png')

plt.show()
