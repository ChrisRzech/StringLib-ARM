@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Outputs a string based @
@ on the value of R0     @
@================@@@@@@@@@
@ Pre-condition  @
@ R0: Boolean    @
@================@
@ Post-condition @
@ R0: --         @
@@@@@@@@@@@@@@@@@@
.data
true:	.asciz	"True"
false:	.asciz	"False"
error:	.asciz	"Not Boolean"

.text
.global	v_bool
v_bool:
	push	{R1,LR}

	cmp	R0,#0
	ldreq	R1,=false	@if(R0 == 0) R1 = false
	beq	return

	cmp	R0,#1
	ldreq	R1,=true	@else if(R0 == 1) R1 = true
	ldrne	R1,=error	@else R1 = error

return:
	bl	string_print

	pop	{R1,LR}
	bx	LR
.end

