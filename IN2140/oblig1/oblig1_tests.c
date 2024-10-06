#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define CNRM "\x1b[0m"
#define CRED "\x1b[31m"
#define CGRN "\x1b[32m"

int stringsum(char *s);
void stringsum2(char *s, int *res);
int distance_between(char *s, char c);
char *string_between(char *s, char c);

static int test_num = 1;

static void logger(int passed, char *s)
{
	char *res;
	char *color;

	if (passed) {
		res = "PASS";
		color = CGRN;
	} else {
		res = "FAIL";
		color = CRED;
	}
	printf("[Test %d][%s%s%s] %s\n", test_num++, color, res, CNRM, s);
}

static void test_stringsum(char *input, int expected)
{
	int test;
	char buf[256] = { 0 };

	test = stringsum(input);
	sprintf(buf, "Returned: %d, Expected: %d", test, expected);
	logger(test == expected, buf);
}

static void test_distance_between(char *str, char c, int expected)
{
	int test;
	char buf[256] = { 0 };

	test = distance_between(str, c);
	sprintf(buf, "Returned: %d, Expected: %d", test, expected);
	logger(test == expected, buf);
}

static void test_string_between(char *str, char c, const char *expected)
{
	char *res_char;
	char buf[256] = { 0 };

	res_char = string_between(str, c);
	snprintf(buf, sizeof(buf), "Returned: %s, Expected: %s", res_char, expected);

	if (!res_char && expected) {
		logger(0, buf);
	} else {
		if (!expected)
			logger(!res_char, buf);
		else
			logger(!strcmp(res_char, expected), buf);
		free(res_char);
	}
}

static void test_stringsum2(char *input, int expected)
{
	int res_int;
	char buf[256] = { 0 };

	stringsum2(input, &res_int);
	sprintf(buf, "Returned: %d, Expected: %d", res_int, expected);
	logger(res_int == expected, buf);
}

int main(void)
{
	printf("Testing stringsum()\n");
	test_stringsum("abcd", 10);
	test_stringsum("a!", -1);
	test_stringsum("aAzZ", 54);
	test_stringsum("ababcDcabcddAbcDaBcabcABCddabCddabcabcddABCabcDd", 120);
	test_stringsum("", 0);

	test_num = 1;
	printf("\nTesting distance_between()\n");
	test_distance_between("a1234a", 'a', 5);
	test_distance_between("a1234", 'a', -1);
	test_distance_between("123456a12334a123a", 'a', 6);
	test_distance_between("", 'a', -1);

	test_num = 1;
	printf("\nTesting string_between()\n");
	test_string_between("a1234a", 'a', "1234");
	test_string_between("a1234", 'a', NULL);
	test_string_between("A123adette er svaretaasd2qd3asd12", 'a', "dette er sv");
	test_string_between("", 'a', NULL);

	test_num = 1;
	printf("\nTesting stringsum2()\n");
	test_stringsum2("abcd", 10);
	test_stringsum2("abcd!", -1);
	test_stringsum2("bbbdbbbbbdbbdbbbbbddbbbbbdbbdbbbbdbd", 90);
	test_stringsum2("", 0);

	return 0;
}
