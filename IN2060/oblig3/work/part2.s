.text
.global main
fib:
	MOV r1, #0
	MOV r2, #1

	loop:
		/* first we check how far into the seq we are */
		CMP r0, #2 @ end at r0==2 because we already have f(1),f(2)
		BEQ done
		SUB r0, r0, #1

		/* then we add fibonacci numbers together with an aux */
		ADD r3, r1, r2
		MOV r1, r2
		MOV r2, r3

		/* goto next number */
		B loop
	done:
		MOV r0, r2 @ store last calcd fib into r0
		BX lr

main:
PUSH {lr}
	MOV r0, #13
	BL fib
	MOV r1, r0
	PUSH {lr}
		LDR r0, =string
		BL printf
	POP {lr}

	MOV r0, #14
	BL fib
	MOV r1, r0
	PUSH {lr}
		LDR r0, =string
		BL printf
	POP {lr}

exit:
POP {lr}
	BX lr

.data
string:
	.asciz "%d\n"
