.data
true:	.asciz	"True"
false:	.asciz	"False"
error:	.asciz	"Error"

.text
.global	v_bool
v_bool:

	push	{R1}

	cmp	R0,#0
	beq	False
	cmp	R0,#1
	beq	True
	bne	Error

False:
	ldr	R1,=false
	bl	string_print
	b	end

True:
	ldr	R1,=true
	bl	string_print
	b	end

Error:
	ldr	R1,=error
	bl	string_print
	b	end

end:
	pop	{R1}
.end