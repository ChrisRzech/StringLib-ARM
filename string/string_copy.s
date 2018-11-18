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
string .req R1   @
char   .req R2   @
@@@@@@@@@@@@@@@@@@
	push	{R1,R2,LR}

	bl	string_length		@R0 = string.length()
	bl	string_malloc		@R0 = newStr
	push	{R0}			@save newStr

loop:
	ldrb	char,[string],#1
	
	cmp	char,#0
	beq	return			@if(char == \0) return
	
	strb	char,[newStr],#1
	b	loop

return:
	pop	{R0}			@load newStr
	pop	{R1,R2,LR}
	bx	LR
.end

