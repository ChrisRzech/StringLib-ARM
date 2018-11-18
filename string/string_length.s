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
string .req R1   @
char   .req R2   @
@@@@@@@@@@@@@@@@@@
	push	{R1,R2}

	mov	length,#0		@initialize counter

loop:
	ldrb	char,[string],#1

	cmp	char,#0
	beq	return			@if(char == \0) return

	add	length,#1
	b	loop

return:
	pop	{R1,R2}
	bx	LR
.end

