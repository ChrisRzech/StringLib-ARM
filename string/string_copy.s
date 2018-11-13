@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Creates a new string that is  @
@ identical to the input string @
@================@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@================@
@ Post-condition @
@ R0: New string @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global string_copy
string_copy:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
newStr .req R0   @
length .req R0   @
string .req R1   @
char   .req R2   @
@@@@@@@@@@@@@@@@@@
	push	{R1,R2,LR}

	bl	string_length		@R0 = string length
	add	length,#1		@increment R0
	bl	string_malloc		@R0 = newStr
	push	{R0}			@push newStr to stack

loop:
	ldrb	char,[string],#1	@load in a character
	
	cmp	char,#0
	beq	exit			@if(char == \0) exit
	
	strb	char,[newStr],#1	@store the character
	b	loop

exit:
	pop	{R0}			@pop newStr off stack
	pop	{R1,R2,LR}
	bx	LR
.end

