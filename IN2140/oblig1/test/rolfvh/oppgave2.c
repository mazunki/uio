#include <stdio.h>
#include <stdlib.h>
#include "helper.h"


int stringsum(char* s) {
	/* returns the sum of the value for all characters in string */
	int len = getstrlen(s);
	int sum = 0;
	for (int i=0; i<len; i++) {
		char c = s[i];
		if (c >= 97 && c <= 122) {
			// shift all a..z letters to A..Z range
			c -= 32;
		}

		if (c >= 65 && c <= 90) {
			// if in A..Z range
			sum += c-64;
		} else {
			// not a letter
			return -1;
		}
	}
	return sum;
}

void stringsum2(char* s, int* res) {
	int val = stringsum(s);
	*res = val;
}

int distance_between(char* s, char c) {
	/* returns the inclusive distance between first two cases of character in string */
	int len = getstrlen(s);
	int start = -1;
	for (int i=0; i<len; i++) {
		if (s[i] == c) {
			if (start == -1) {
				start = i;
			} else {
				return i-start;
			}
		}
	}
	return -1;
}

char* string_between(char* s, char c) {
	/* returns substring between two first cases of character in string */
	int dist = distance_between(s, c);
	if (dist == -1) {
		return NULL;
	}
	char* substring = (char*) malloc(dist*sizeof(char)); // (distance-1) + 1 for '\0'
	int start=0;
	while (s[start] != c) {
		start++;
	}

	for (int i=0; i<dist-1; i++) {
		substring[i] = s[start+i+1];
	}
	substring[dist] = '\0';
	return substring;
}

/*int main(int argc, char* argv[]) {
	printf("%d  %d\n", stringsum("abcd"), stringsum("hei!"));
	printf("%d  %d  %d\n", distance_between("a1234a", 'a'), distance_between("hei!", 'a'), distance_between("hei!", 'e'));
	char* t1 = "a1234a";
	char* t2 = "hei!";

	char* test1 = string_between(t1, 'a');
	char* test2 = string_between(t2, 'a');

	int res;
	stringsum2("abcd", &res);
	stringsum2("ab!", &res);

	printf("\n");
	return 0;
}*/

