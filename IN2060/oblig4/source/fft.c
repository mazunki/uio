#include "fft.h"

/**
 * This file contains the implementation of `fft_compute` and ancillary
 * functions.
 */

#include <math.h>
const double TAU = 2. * M_PI;

#include <stdlib.h>

void fft(const complex* s_in, complex* twiddles, complex* s_out, complex* buffer, int N, int skip) {
	/*
	if (N == 64) { // specific to 64-byte line cache
		nr_fft(s_in, twiddles, s_out, skip);
		return;
	}*/

	if (N == 1) { // end of recursion
		s_out[0] = s_in[0];
		return;
	}

	const int half = N >> 1;
	complex *odd_out = buffer + half; // the buffer is a whole sample size but we just change odd's adress to midway
	
	fft(s_in,        twiddles,  buffer, s_out, half, skip*2);
	fft(s_in + skip, twiddles, odd_out, s_out, half, skip*2);
	
	for(int i = 0; i < half; ++i) {
		complex wo = twiddles[i * skip] * odd_out[i];
		s_out[i]      = buffer[i] + wo;
		s_out[i+half] = buffer[i] - wo;
	}
}

void nr_fft(const complex* s_in, complex* twiddles, complex* s_out, int skip) {
	/*
		not implemented, but is meant to be a non-recursive function, doing a whole line-cache at a time,
		instead of recursing down to 1 element
	*/

}

complex* precalc_twiddles(int N) {
	/*
		we precalc the exponential parts for the `wo` part of calculating the dft
		it's faster to read a value than it is to calculate it, especially if we are abl
		to store it in L1, which is likely considering how continuously it will be read.

		in any case, it will be stored, in cache during the whole for-loop,
		hardware will get the next line-cache preemptively when we approach i=64 * k, 
		where it will need the next line-cache
	*/
	int half = N>>1;
	complex* twiddles = malloc(sizeof(complex) * half); 
	const double mult = -TAU/N; // no need to calc this N/2 times lol

	for (int i=0; i < half; i++) {
		twiddles[i] = cexp(mult*I*i);
	}
	return twiddles;
}

void fft_compute(const complex* in, complex* out, const int n) {
	// handy to keep odd+even values, instead of recreating memory over and over again
	// this should probably be on L1
	complex* buffer = (complex*) malloc(sizeof(complex) * n); 
	complex* twiddles = precalc_twiddles(n);

	fft(in, twiddles, out, buffer, n, 1);
	free(twiddles);
	free(buffer);
}
