/**
 * This is the main file which will benchmark your FFT code against FFTW.
 *
 * You will *not* need to edit this file and for your delivery we will not
 * test custom main files.
 */

// Include above `fftw3` to ensure that we can use standard library
// complex numbers
#include <complex.h>
// Include to get access to system wide FFT code
#include <fftw3.h>
// Included to get access to floating point limits
#include <float.h>
// Included to get access to `printf`
#include <stdio.h>
// Included to get access to `exit`
#include <stdlib.h>
// Include to get access to precise timing on Linux
#include <time.h>

// Include custom FFT header here so that we can access custom FFT calculation
#include "fft.h"

// Helper method to fill an array with random complex values between [0, 1)
void fill_random(fftw_complex* in, const int size) {
	for(int i = 0; i < size; ++i) {
		double real = (double) rand() / (double) RAND_MAX;
		double imag = (double) rand() / (double) RAND_MAX;
		in[i] = real + imag * I;
	}
}

// Calculate the difference between two `timespec` instances in microseconds
double diff_micro(const struct timespec start, const struct timespec end) {
	const double diff_sec  = (double)(end.tv_sec - start.tv_sec) * 1000000.0;
	const double diff_nano = (double)(end.tv_nsec - start.tv_nsec) / 1000.0;
	return diff_sec + diff_nano;
}

int main(int argc, char** argv) {
	// Declare input parameters
	int size = 0;
	// How many repetitions should we perform to ensure good benchmark
	// accuracy
	int reps = 100;
	// Check input arguments
	if(argc < 3) {
		printf("Too few arguments, expected two: N (size of FFT)\
				and R (number of repetitions)\n");
		exit(EXIT_FAILURE);
	} else {
		// Convert input to integer
		size = strtol(argv[1], NULL, 10);
		// Ensure we got a power of 2
		if((size & (size - 1)) != 0) {
			printf("FFT size must be a power of 2! Was: %i\n",
					size);
			exit(EXIT_FAILURE);
		}
		reps = strtol(argv[2], NULL, 10);
		if(reps < 1) {
			printf("Repetitions must be > 0!\n");
			exit(EXIT_FAILURE);
		}
	}
	// Setup parameters for FFTW (and custom FFT code)
	fftw_complex *in, *out, *out2;
	fftw_plan p;
	// Allocate space for data
	in   = fftw_alloc_complex(size);
	out  = fftw_alloc_complex(size);
	out2 = fftw_alloc_complex(size);
	// Let FFTW cheat and create a plan that we do not time
	// this is the reason FFTW can be so fast, however, you have intimate
	// knowledge about the processor and should have a fighting chance!
	p = fftw_plan_dft_1d(size, in, out, FFTW_FORWARD, FFTW_MEASURE);
	// Initialize random seed with current time
	srand(time(NULL));
	// Next we fill the input array with data
	fill_random(in, size);
	// Next is the important part, we first benchmark FFTW and then our
	// custom code
	struct timespec start_fftw, stop_fftw, start_custom, stop_custom;
	clock_gettime(CLOCK_MONOTONIC_RAW, &start_fftw);
	for(int i = 0; i < reps; i++) {
		fftw_execute(p);
	}
	clock_gettime(CLOCK_MONOTONIC_RAW, &stop_fftw);
	// Time custom code
	clock_gettime(CLOCK_MONOTONIC_RAW, &start_custom);
	for(int i = 0; i < reps; i++) {
		fft_compute(in, out2, size);
	}
	clock_gettime(CLOCK_MONOTONIC_RAW, &stop_custom);
	// We assume that the code is correct so we simply output
	// the timing differences
	const double diff_fftw = diff_micro(start_fftw, stop_fftw) / (double) reps;
	const double diff_custom = diff_micro(start_custom, stop_custom) / (double) reps;
	printf("FFTW used %.2f usec\n", diff_fftw);
	printf("Custom FFT used %.2f usec\n", diff_custom);
	printf("Custom FFT is %.3f times as fast compared to FFTW!\n",
			diff_fftw / diff_custom);
	// After we are done measuring everything we must free FFTW specifics
	fftw_destroy_plan(p);
	fftw_free(in);
	fftw_free(out);
	fftw_free(out2);
	exit(EXIT_SUCCESS);
}
