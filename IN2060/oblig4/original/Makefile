# Compiler to utilize
CC=gcc
# Flags to pass to the compiler
FLAGS=-o3 -g -std=gnu11
# Libraries to link against
LINK=-lpthread -fopenmp -lfftw3 -lm

# Phony targets that Make should ignore
.PHONY: clean all run

# First target builds everything
all: test bench

# Build only the custom FFT code
fft.o: fft.h fft.c
	$(CC) $(FLAGS) $(LINK) -o fft.o -c fft.c

# Build test code for verifying that the output is correct
test: fft.o test.c
	$(CC) $(FLAGS) test.c fft.o $(LINK) -o test 

# Build benchmark code to time FFT implementation
bench: fft.o bench.c
	$(CC) $(FLAGS) bench.c fft.o $(LINK) -o bench 

# Helper function to test and benchmark
run: test bench
	bash run.sh

# Clean up if needed
clean:
	rm -f test bench fft.o
