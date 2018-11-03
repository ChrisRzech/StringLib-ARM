@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the amount of    @
@ characters in the string @
@================@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@================@
@ Post-condition @
@ R0: Length     @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global string_length
string_length:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
length .req R0   @
strPtr .req R1   @
char   .req R2   @
@@@@@@@@@@@@@@@@@@
	push	{R1,R2}

	mov	length,#0		@initialize counter

loop:
	ldrb	char,[strPtr],#1	@load in a character (byte)
	cmp	char,#0			@see if its a \0
	beq	exit

	add	length,#1		@increment counter
	b	loop			@loop back

exit:
	pop	{R1,R2}
	bx	LR
.end

