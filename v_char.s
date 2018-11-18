@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prints an ASCII character @
@================@@@@@@@@@@@@
@ Pre-condition  @
@ R1: Character  @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.data
char:	.asciz	" "

.text
.global v_char
v_char:
	push	{R1,R2,LR}

	mov	R2,R1
	ldr	R1,=char
	strb	R2,[R1]
	bl	string_print

	pop	{R1,R2,LR}
	bx	LR
.end

