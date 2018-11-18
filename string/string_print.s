@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prints a string until @
@ a null terminator \0  @
@ is reached            @
@================@@@@@@@@
@ Pre-condition  @
@ R1: String     @
@================@
@ Post-condition @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global string_print
string_print:
	push	{R0,R2,R7,LR}

	bl	string_length	@obtain string length

	mov	R2,R0		@output size
	mov	R0,#1		@code for stdout
	mov	R7,#4		@code for display
	svc	0		@service call

	pop	{R0,R2,R7,LR}
	bx	LR
.end

