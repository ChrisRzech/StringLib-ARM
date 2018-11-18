@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Checks whether a string is @
@ equal to another string    @
@================@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String A   @
@ R2: String B   @
@================@
@ Post-condition @
@ R0: Boolean    @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_equals
string_equals:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
equals .req R0   @
str1   .req R1   @
str2   .req R2   @
char1  .req R3   @
char2  .req R4   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4}

	mov	equals,#1		@initialize boolean

loop:
	ldrb	char1,[str1],#1
	ldrb	char2,[str2],#1

	cmp	char1,char2
	movne	equals,#0		@if(char1 != char2) return false
	bne	return

	cmp	char1,#0
	beq	return			@if(char1 == \0) return

	b	loop

return:
	pop	{R1-R4}
	bx	LR
.end

