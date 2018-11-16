.data
true:	.asciz	"True"
false:	.asciz	"False"
error:	.asciz	"Error"

.text
.global	v_bool
v_bool:
	push	{R1,LR}

	cmp	R0,#0
	ldreq	R1,=false
	beq	exit
	cmp	R0,#1
	ldreq	R1,=true
	ldrne	R1,=error
	b	exit

end:
	bl	string_print

	pop	{R1,LR}
	bx	LR
.end

