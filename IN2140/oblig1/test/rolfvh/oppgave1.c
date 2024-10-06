#include <stdio.h>
#include "helper.h"

int main(int argc, char* argv[]) {
	char* input_str = argv[1];
	char match_char = argv[2][0];
	char replace_char = argv[3][0];
	
	int len = getstrlen(input_str);
	for (int i=0; i<len; i++) {
		if (input_str[i] == match_char) {
			input_str[i] = replace_char;
		}
	}

	for (int i=0; i<len; i++) {
		printf("%c", input_str[i]);
	}

	printf("\n");
	return 0;
}
