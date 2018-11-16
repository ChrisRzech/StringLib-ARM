@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Outputs a newline character @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.data
endl:	.asciz	"\n"

.text
.global v_endl
v_endl:
	push	{R1,LR}

	ldr	R1,=endl
	bl	string_print

	pop	{R1,LR}
	bx	LR
.end

