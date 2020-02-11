from earthmoon import *


t = lambda n: 14.753*n
def tester(time):
	print(time)
	print("r1: {}, r2: {}, r: {}".format(r1(t(time-0.2)), r2(t(time-0.2)), r(t(time-0.2))))
	print("r1: {}, r2: {}, r: {}".format(r1(t(time)), r2(t(time)), r(t(time))))
	print("r1: {}, r2: {}, r: {}".format(r1(t(time+0.2)), r2(t(time+0.2)), r(t(time+0.2))))


print("r1: {}, r2: {}, r: {}".format(r1(t(0)), r2(t(0)), r(t(0))))
tester(0)
tester(1)
tester(1.5)
tester(2)
