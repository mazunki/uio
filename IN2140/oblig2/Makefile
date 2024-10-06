CCFLAG=-g
DEPS=commands.h input.h output.h router.h
OBJS=commands.o input.o output.o router.o

all: $(DEPS) $(OBJS)
	gcc $(CCFLAG) main.c $(OBJS) -o ./run

%.o: %.c $(DEPS)
	gcc $(CCFLAG) -c -o $@ $<

clean:
	rm -f *.o run
