CCFLAG=-g


all: oppgave1 oppgave2.o oblig1_tests

oblig1_tests: oppgave1.o oppgave2.o helper.o
	gcc $(CCFLAG)  -o oblig1_tests oblig1_tests.c oppgave2.o helper.o

oppgave1: oppgave1.o helper.o
	gcc $(CCFLAG) oppgave1.o helper.o -o oppgave1	

helper.o:
	gcc $(CCFLAG) -c helper.c
oppgave1.o: helper.o
oppgave2.o: helper.o

clean:
	rm -f oppgave1 oppgave2 *.o *.out *.s
