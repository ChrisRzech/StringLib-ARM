@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Sets the overflow flag @
@================@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@================@
@ Post-condition @
@ R0: --         @
@@@@@@@@@@@@@@@@@@
.global string_set_ovfl
string_set_ovfl:
	push	{R0}

	mov	R0,#0x80000000	@MSB = 1
	subs	R0,#1		@MSB = 0 -> C = 1, V = 1
	mov	R0,#0x10
	asrs	R0,#1		@R0 = 0x1 -> C = 0, V unchanged

	pop	{R0}
	bx	LR
.end

