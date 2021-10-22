#include <stdio.h>

int main(int argc, char** argv) {
	for (int i=1; i<101; i++) {
		if (!(i % 15)) printf("FizzBuzz!");
		else if (!(i % 3)) printf("Fizz");
		else if (!(i % 5)) printf("Buzz");
		else printf("%i", i);
		printf("\n");
	}
	return 0;
}