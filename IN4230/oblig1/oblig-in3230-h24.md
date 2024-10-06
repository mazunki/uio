% Title: Obligatorisk oppgave - IN3230/IN4230 - Høst 2024
% Author: Kristjon Ciko <kristjoc@ifi.uio.no>
% ------
% Name: Mazunki Hoksaas
% Username: rolfvh
% Submission date: 2024-08-29
% Course code: IN4230
% ------


## 1. What does this function return?

    1  int f1(int a, int b) {
    2      return (a>b?a:b);
    3  }

- A. compiler error
- B. the smaller value of the two passed parameters
- C. the greater value of the two passed parameters
- D. runtime error

*Answer*: c
*Explanation*: The ternary operator (`cond ? a : b`) is just an if-condition in disguise. The first value after `?` is returned if the condition is true, and the value after `:` is passed otherwise. To note, the parentheses around the ternary operator are redundant.


## 2. Which is not a correct way to declare a string variable?

- A. `char str = "Hei IN3230";`
- B. `char *str = "Hei IN3230";`
- C. `char str[20] = {'H', 'e', 'i', ' ', 'I', 'N', '3', '2', '3', '0', '\0'};`
- D. `char str[] = "Hei IN3230";`

*Answer*: a
*Explanation*: Strings, as created with `"..."` in C are really just sugar syntax around an array of chars. Assigning an array pointer to a `char` tells the compiler we want to treat the pointer the string returns as a 1-byte number, and not a pointer (generally 8 bytes on modern systems). Unless our address space is very narrow, this will overflow and point to a completely wrong address. Luckily, compilers are smart enough to distinguish values from pointers, and will not allow you to do this without explicit casting.


## 3. Which function do you use to deallocate memory?

- A. `dalloc()`
- B. `release()`
- C. `free()`
- D. `dealloc()`

*Answer*: c
*Explanation*: Unless you have your own wrapper around the libc-provided heap memory manager, only `free()` actually exists in the standard library. Granted, I would argue the correct answer would be none of them. If what you're allocating is simple enough, you might as well just create in on the stack on the caller side, and pass it by reference to the callee. If it's more complicated than a trivial allocation, I'd argue you'd be better of creating some custom `my_struct *m = my_struct_alloc()` wrapper with its matching `my_struct_free(m)` pair and use those instead.


## 4. In which segment does dynamic memory allocation take place?

- A. BSS segment
- B. stack
- C. data segment
- D. heap

*Answer*: d
*Explanation*: Ideally the heap, anyway. If you're not, you're screwed.


## 5. What is not a valid command with this declaration?

    1 char *string[20] = {"one", "two", "three"};

- A. `printf("%c", string[1][2]);`
- B. `printf("%s", string[1][2]);`
- C. `printf(string[1]);`
- D. `printf("%s", string[1]);`

*Answer*: b and c
*Explanation*: While technically `c` is legal, it's a very stupid thing to do. Compiling your code with `-Wformat-security` would warn you of this. `b` attempts to write the string starting at address position `0x6F`, which you will more than likely not have access to, and will keep reading until a `NUL` character. This will almost inconsequently give a segmentation error.


## 6. Void pointer `vptr` is assigned the address of float variable `g`. What is a valid way to dereference `vptr` to assign its pointed value to a float variable named `f` later in the program?

    1  float g;
    2  void *vptr = &g;

- A. `f = *(float)vptr;`
- B. `f = (float)*vptr;`
- C. `f = *(float *)vptr;`
- D. `f = (float *)vptr;`

*Answer*: b
*Explanation*: `*vptr` will read the value stored at the address known as `vptr`. While technically only required as a formality, here, we explicitly tell the compiler we want to interpret the dereferenced value, which doesn't have a known type yet, as a float.


## 7. What does the `strcmp(str1, str2);` function return?

- A.
    • true (1) if str1 and str2 are the same
    • NULL if str1 and str2 are not the same

- B.
    - 0 if str1 and str2 are the same
    - a negative number if str1 is less than str2
    - a positive number if str1 is greater than str2

- C.
    - true (1) if str1 and str2 are the same
    - false (0) if str1 and str2 are not the same

- D.
    - 0 if str1 and str2 are the same
    - a negative number if str2 is less than str1
    - a positive number if str2 is greater than str1

*Answer*: b
*Explanation*: `strcmp(3)` tells me. As a mnemonic, I consider this function to tell me which argument has the lowest value, and will walk in the direction, on the number line, which matches the lowest number between both given strings. The left argument is `str1`, and the right one is `str2`. Walking left on the number line gives -1. Walking right gives +1. If we're not walking anywhere, we're still at zero, meaning they're equivalent.


## 8. How many times does the code inside the while loop get executed in this program?

    1  void main() {
    2  int x=1;
    3      while (x++<100) {
    4          x*=x;
    5          if (×<10) continue;
    6          if (x>50) break;
    7      }
    8  }

- A. 5
- B. 50
- C. 100
- D. 3

*Answer*: d
*Explanation*: The `continue` statement here is essentially a no-op. The `<100` condition in the while-condition is redundant in this context. We're essentially just checking how many times we can run `x*=++x` before we hit 50, which is very low. We start with x=1, and after each iteration we get the values 4, 25 and 676.


## 9. Which choice is an include guard for the header file mylib.h?

A.
```
#ifndef MYLIB_H
#define MYLIB_H
//mylib.h content
#endif /* MYLIB_H */
```

B.
```
#define MYLIB_H
#include "mylib.h"
#undef MYLIB_H
```

C.
```
#ifdef MYLIB_H
#define MYLIB_H
//mylib.h content
#endif /* MYLIB_H */
```

D.
```
#ifdef MYLIB_H
#undef MYLIB_H
//mylib.h content
#endif /* MYLIB_H */
```

*Answer*: a
*Explanation*: While just a convention, include guards are often named after the filename of the header itself, in uppercase and replacing non-alphabet characters with underscores. I also prefer adding the unnecessary comment after `#endif` to explicitly make it clear which clause we're meant to close, but in practice I find that this practice is a hit or miss.


## 10. What is the sequence printed by the following program?

    1  #include <stdio.h>
    2
    3  void print_3_ints(int *ip)
    4  {
    5      printf("%d %d %d ", ip[0], ip[1], ip[2]);
    6  }
    7
    8
    9  int main(void)
    10 {
    11     int array[] = { 5, 23, 119, 17 };
    12     int *p, *q, d;
    13
    14     p = array; q = p + 1;
    15
    16     print_3_ints(q);
    17
    18     d = *(p++);
    19     printf("%d ", d);
    20
    21     d = ++(*p);
    22     printf("%d ", d);
    23
    24     printf("\n");
    25     return 0;
    26 }

- A. 23 119 17 5 24
- B. 23 119 17 23 24
- C. 24 120 18 6 25
- D. 25 120 18 25 26

*Answer*: a
*Explanation*: I see that `print_3_ints` prints `q`, which is really just the next `int` in memory after the first `p` (which is thus `&array[1]`), giving me options `a` or `b`. I then see that we're dereferencing `p` which is really equivalent to `array[0]`, with a post-increment to `p` which I don't care about. Only `a` remains.


## 11. What is the output of the following program?

    1  #include <stdio.h>
    2
    3  void func(int *ptr)
    4  {
    5      *ptr = 30;
    6  }
    7
    8  int main()
    9  {
    10     int y = 20;
    11     func(&y);
    12     printf("%d\n", y);
    13
    14     return 0;
    15 }

- A. 20
- B. 30
- C. Compiler error
- D. Runtime error

*Answer*: b
*Explanation*: We're sending in an address to our function, which expects an address to an integer. We then assign a new value to the location expressed by this address. After we return from our function, since we were simply telling `func()` to place a thing at a place, the value of said place has now changed to the new value.


## 12. What is the output of the following program?

    1  #include <stdio.h>
    2  #include <stdlib.h>
    3
    4  int main()
    5  {
    6      int i, numbers[1];
    7      numbers[0] = 15;
    8      free(numbers);
    9      printf("Stored integers are ");
    10     printf("numbers[%d] = %d ", 0, numbers[0]);
    11
    12     return 0;
    13 }

A. Runtime error
B. Compilation error
C. 0
D. Garbage value

*Answer*: a
*Explanation*: You're not allowed to `free()` pointers which aren't allocated by the heap (I am not entirely sure if this is accurate. Are we allowed to free non-allocated addresses which would otherwise be on the heap? I know use-after-free and double-free are both technically allowed through Undefined Behaviour, but I'm not sure if this applies to the whole unused address space). Doing so causes the libc to `abort()` and thus abruptly shut down the program.


## 13. What is the error of this program?

    1  #include <stdio.h>
    2  #include <stdlib.h>
    3  #include <string.h>
	4
    5  int main()
    6  {
    7      char *ptr;
    8      *ptr = (char)malloc(8);
    9      strcpy(ptr, "RAM");
    10     printf("%s", ptr);
    11     free(ptr);
    12     return 0;
    13 }

- A. Error in `strcpy()` statement
- B. Error in `*ptr = (char)malloc(8);`
- C. Error in `free(ptr);`
- D. No error

*Answer*: b
*Explanation*: We're trying to assign the address returned by `malloc()` to the memory location attributed to `ptr`, after casting it down from the standard width of a pointer (4 or 8, usually) to a single byte. `ptr` should really hold the value of an address. We should be using `(char *)` here instead (even if redundant, since void pointers can be implicitly cast without raising any alarms). Furthermore, we don't really want to have to dereference the value of our pointer every time we use it, so it would make more sense to just assign the address to `ptr` directly, freeing up a single allocated `char` from the stack. Pedantically, I would have written this line as `ptr = (char *) malloc(8*sizeof(char));`.


## 14. What is the output of the following program?

    1  #include <stdio.h>
    2
    3  struct result{
    4      char sub[20];
    5      int marks;
    6  };
    7
    8  int main()
    9  {
    10     struct result res[] = {
    11          {"IN3230",100},
    12    		{"IN4230",90},
    13    		{"Norsk",85}};
    14
    15     printf("%s ", res[1].sub);
    16
    17     printf("%d\n", (*(res+2)).marks);
    18
    19     return 0;
    20 }

- A. IN3230 100
- B. IN4230 85
- C. IN4230 90
- D. Norsk 100

*Answer*: c
*Explanation*: From the first line, we can see that we're getting the `sub` string from the 1th struct of the array, which coincides with `"IN4230"`. Following, we see that through some dirty pointer maths, we are instead dereferencing the 2th struct of the array, being `{"Norsk", 85}`, and reading its marks.


## 15. What is the output of this code snippet?

    1  void main()
    2  {
    3      struct bitfields {
    4          int bits_1: 2;
    5          int bits_2: 9;
    6          int bits_3: 6;
    7          int bits_4: 1;
    8      }bit;
    9
    10     printf("%d\n", sizeof(bit));
    11 }

- A. 2
- B. 3
- C. 4
- D. 0

*Answer*: c
*Explanation*: While this application of a `struct` is a bit unorthodox, we're reducing the size of our integers, which are generally of width 32, to the bit sizes 2, 9, 6 and 1. While it may depend on compiler alignment rules, this will generally allow the compiler to shrink the size of the array to whatever size it deems fit. Since we only need 2+9+6+1 (18) bits, we can fit all this in a single `int` (since `int` generally is 32 bits == 4 bytes), saving us some memory. Of course, this comes at some computation cost.


## 16. In which line is the BUG in the following program?

    1  #include <stdio.h>
    2
    3  int main()
    4  {
    5      int a, *ptr;
    6      a = 25;
    7      *ptr = a + 5;
    8
    9      return 0;
    10 }

*Answer*: 7
*Explanation*: We're attempting to write 30 to the location specified by `ptr`. Issue being that the value held by `ptr` points to an invalid location we likely don't have access to write to. Some compilers may choose `0` (or `NULL`, thus a null pointer) for this random location. `ptr = malloc(sizeof(int));` prior to the assignment would fix the problem.


## 17. In which line is the BUG in the following program?

    1  #include <stdio.h>
    2  struct var {
    3      int value;
    4      int *address;
    5  };
    6
    7  int main()
    8  {
    9      struct var y;
    10     int a = 10;
    11     int *ptr = &a;
    12
    13     y.value = *ptr;
    14     (&y)->address = ptr;
    15
    16     printf("value %d\n", y.value);
    17     printf("address %p\n", y->address);
    18     return 0;
    19  }

*Answer*: 17
*Explanation*: By using the arrow notation, we're attempting to dereference `y` prior to reading its address. `y->address` is equivalent to `(*y).address`, but it doesn't make any sense to dereference its value. `y` is not a pointer, but a `struct`.


## 18. What are the two mistakes in the following program?

    1   #include <stdio.h>
    2
    3   int main () {
    4       const char src[8] = "IN3230";
    5       char dest[8];
    6
    7       strcpy(dest, "Hellllo");
    8
    9       memcpy(dest, src, strlen(src));
    10
	11      printf("%s\n", dest);
    12      return(0);
    13  }

*Answer*: 4, 9
*Explanation*: The size of `src` should be `7` and not `8`. Furthermore, we're overriding the six characters from `src`, without its trailing NUL-byte. This causes the rest of the string from `"Hellllo"` which was in dest already to remain there as part of the string. We could make do with `const char src[6] = "IN3230";` too, avoiding the need for `strlen(src)+1`, if we added `*(dest+6) = 0`. In this context that'd be a bit weird, but eh, it's a common pattern. Also, decorating `return` as a function which takes `0` as its first argument hurts my eyes, even if strictly valid.
