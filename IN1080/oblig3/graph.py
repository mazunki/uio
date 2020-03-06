import matplotlib.pyplot as plt
import matplotlib.ticker as tkr
import matplotlib.axis as ax
import numpy as np

# plt.subplots_adjust(top=0.9, bottom=0.1, hspace=1.3)

hertz = 200
resistance1 = 36171
resistance2= 10000
capacitor = 22e-9

#times = np.linspace(0, 20000, num=300)
times = np.geomspace(0.01, 40000, num=100)

output_value = lambda hertz, r: 1 / ( np.sqrt(1+ (hertz * r * capacitor)**2 ) )

fig, axe = plt.subplots()
plt.loglog()
#axe.xaxis([0.01,50000,0.01,2])
for axis in [axe.xaxis, axe.yaxis]:
    axis.set_major_formatter(tkr.ScalarFormatter())


axe.plot(times, output_value(times, resistance1), label="$R=36k\\Omega$")
axe.plot(times, output_value(times, resistance2), label="$R=10k\\Omega$")
plt.ylabel('Voltage ($V_{out}/V_{in}$)', usetex=True)
plt.xlabel(u'Frequency ($Hz$)')
axe.grid(True, which="both")
plt.legend()


plt.savefig("logarithmiclowpassfilter.png")
#plt.savefig("scalarlowpassfilter.png")
plt.show()