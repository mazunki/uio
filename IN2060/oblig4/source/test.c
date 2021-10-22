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
// Included to get access to `time` function
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

int main(int argc, char** argv) {
	// Declare input parameters
	int size = 0;
	// Check input arguments
	if(argc < 2) {
		printf("Too few arguments, expected one: N (size of FFT)\n");
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
	// Initialize random seed with current time, this ensures that
	// every run gives different data so that we minimize the possibility
	// of misjudging the custom FFT code
	srand(time(NULL));
	// Next we fill the input array with data
	fill_random(in, size);
	// Run both FFTs so that we can compare the outputs
	fftw_execute(p);
	fft_compute(in, out2, size);
	// First we ensure that the two outputs are equal and then print
	// timing information
	int errors = 0;
	for(int i = 0; i < size; ++i) {
		// Calculate the difference between FFTW and custom FFT code
		const complex diff = cabs(out[i] - out2[i]);
		// If either real or imaginary part is larger than some small constant
		// we warn the users of errors in the result
		if(creal(diff) > FLT_EPSILON || cimag(diff) > FLT_EPSILON) {
			errors += 1;
			if(errors <= 10) {
				printf("\tFound error at index %i, expected %.3f + %.3fi, found %.3f + %.3fi\n",
						i, creal(out[i]), cimag(out[i]),
						creal(out2[i]), cimag(out2[i]));
			}
		}
	}
	// After we are done comparing output we free resources
	fftw_destroy_plan(p);
	fftw_free(in);
	fftw_free(out);
	fftw_free(out2);
	// Lastly we output success or failure
	if(errors > 0) {
		printf("Custom FFT code is not correct, found %i (out of %i) errors\n",
				errors, size);
		exit(EXIT_FAILURE);
	} else {
		printf("Found no errors, it seems your code is correct!\n");
		exit(EXIT_SUCCESS);
	}
}
