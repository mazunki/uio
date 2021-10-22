	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"part3.c"
	.text
	.align	2
	.global	fib
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	fib, %function
fib:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	mov	r3, #0
.L2:
	cmp	r0, #0
	bne	.L3
	mov	r0, r3
	bx	lr
.L3:
	add	r1, r3, r2
	sub	r0, r0, #1
	mov	r2, r3
	mov	r3, r1
	b	.L2
	.size	fib, .-fib
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #13
	bl	fib
	mov	r1, r0
	ldr	r0, .L6
	bl	printf
	mov	r0, #0
	pop	{r4, pc}
.L7:
	.align	2
.L6:
	.word	.LC0
	.size	main, .-main
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%d\012\000"
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
