@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the amount of  @
@ characters in a string @
@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-Condition      @
@--------------------@
@ R0: n/a            @
@ R1: String Pointer @
@====================@
@ Post-Condition     @
@--------------------@
@ R0: String Length  @
@ R1: String Pointer @
@@@@@@@@@@@@@@@@@@@@@@
.global	string_length
string_length:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
@----------------@
length .req R0   @
strPtr .req R1   @
char   .req R2   @
@@@@@@@@@@@@@@@@@@
	mov	length,#0		@initialize counter

loop:
	ldrb	char,[strPtr],#1	@load in a character (byte)
	cmp	char,#0			@see if its a \0
	beq	exit

	add	length,#1		@increment counter
	b	loop			@loop back

exit:
	bx	LR
.end

