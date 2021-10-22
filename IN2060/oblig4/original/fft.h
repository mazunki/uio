#pragma once
// The above line must always be present in header files!

/**
 * This file contains the Header of your custom FFT implementation.
 *
 * This is the place to put custom method stubs so that other code
 * (e.g. `main.c`) can import and interact with your code. At the time
 * of delivery this header should only contain shared imports (for access
 * to custom types or methods) and one method declaration which defines
 * the interface for your FFT code.
 */

// Include standard library header for complex numbers so that we can
// access the type `complex`
#include <complex.h>

/**
 * Compute the Fast Fourier Transform (FFT)
 *
 * The inputs are two arrays of size `n` where `in` contains the input
 * to the algorithm and `out` will contain the result after calculation.
 *
 * NOTE:
 * - `n` will always be a power of 2 (e.g. 2, 4, 8, 16...)
 */
void fft_compute(const complex* in, complex* out, const int n);
