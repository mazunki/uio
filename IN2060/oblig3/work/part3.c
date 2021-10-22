#include <stdio.h>

// Our now familiar Fibonacci function
int fib(unsigned int n) {
    // Initialize variables
    int curr = 0;
    int prev = 1;
    // Loop until done
    while(n != 0) {
        int tmp = curr;
        curr = curr + prev;
        prev = tmp;
        n = n - 1;
    }
    // Return as usual
    return curr;
}

// Main is required in C and "should" return an integer,
// for now we can ignore the arguments to this function
int main(int argc, char** argv) {
    // Calculate the 13th Fibonacci number
    const int f = fib(13);
    printf("%d\n", f);
    // In C main should return a "status" of the program when
    // exiting, '0' means successful (program terminated as
    // expected)
    return 0;
}


