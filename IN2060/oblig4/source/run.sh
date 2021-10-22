#!/usr/bin/bash

# Declare data file name and if user supplied use that instead
data_name="time.dat"
if [[ $# -gt 0 ]]; then
	data_name=$1
	echo "Using custom output filename '$data_name'"
fi

# Different sizes of FFTs to test
test_sizes=(64 128 256 512 1024)
# Different sizes of FFTs to benchmark
bench_sizes=(256 1024 4096 16384 65536 131072)
# Number of times per benchmark size
bench_times=50

echo "Preparing to test implementation"
for size in ${test_sizes[*]}
do
	# We run test piping output to avoid cluttering
	./test $size > /dev/null
	if [[ $? != 0 ]]; then
		echo "Test failed for size $size"
		exit 1
	fi
done

echo "All test passed, preparing to benchmark program"
# If benchmarks exit we also exit
set -e
for size in ${bench_sizes[*]}
do
	echo -e "\tBenchmarking FFT size $size"
	# Benchmark and extract timing information
	result=`./bench $size $bench_times | awk 'match($0, /([0-9]+\.[0-9]+) usec/,a){print a[1]}' | xargs`
	echo "$size $result" >> $data_name
done

# Sort input file in case of several runs
sort -n -k 1,1 $data_name -o $data_name

# If using a custom data name we don't create automatic plot
if [[ $data_name == "time.dat" ]]; then
	echo "Creating plot of benchmarks"
	# Use gnuplot to show performance over different FFT sizes
	gnuplot plot.p
	xdg-open time_diff.png
fi
echo "Done"
