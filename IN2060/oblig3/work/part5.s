
@num1: .word 0x3f800000
@num2: .word 0x3f800000
@num1: .word 0x40a00000
@num2: .word 0x41b80000
@num1: .word 0x3f010000
@num2: .word 0x40000000
@num1: .word 0x40600000
@num2: .word 0x40400000
num1: .word 0x40900000
num2: .word 0x3fc00000


aux : .word 0x80000000
expm: .word 0xFF800000

.text
.global main

main:
	LDR r0, num1
	LDR r1, num2
	LDR r8, aux @ we use this for a mask while adding sci notation
	LDR r9, expm

/* we store highest number in r2 and lowest in r1 */
	CMP r0, r1
	BLT r0low
	MOV r2, r0
	MOV r1, r1
	B r0high
r0low:
	MOV r2, r1
	MOV r1, r0
r0high:
	MOV r0, r1
	MOV r1, r2


/* we store the exponent bits into r2 and r3 for r0 and r1 respectively */
/* since we only have positive integers we don't need to AND-mask the sign bit */
	LSR r2, r0, #23
	LSR r3, r1, #23
	SUB r3, r3, r2 @ store the difference in exponent rather than the absolute value
	
/* since r0 is highest, we can just right shift r0's decimal part r3 number of times, if not 0 */
	LSL r4, r0, #9 @ smol number decimal part
	LSL r5, r1, #9 @ big number decimal

	CMP r3, #0
	BEQ sum
	LSR r4, r4, #1
	ORR r4, r4, r8 @ LSR inserts a 0 but we bitswap the MSB to a 1 because of sci-notation. 
	SUB r3, r3, #1
	LSR r4, r4, r3 @ and then just insert the rest of zeroes
/* at this point we have aligned exponents for the decimal parts of r4 and r5 */
sum:
	ADD r4, r5 @ store sum of decimal parts in r4
	LSR r4, #9 @ make space for exponent

	AND r1, r1, r9 @ mask exponent bits to replace
	ORR r0, r4, r1 @ insert exponent bits, save
	
done:
	BX lr

string:
	.asciz "%f\n"
