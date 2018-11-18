@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Outputs a single space @
@@@@@@@@@@@@@@@@@@@@@@@@@@
.data
space:	.asciz	" "

.text
.global v_space
v_space:
	push	{R1,LR}

	ldr	R1,=space
	bl	string_print

	pop	{R1,LR}
	bx	LR
.end

