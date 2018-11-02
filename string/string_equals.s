@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns a if two strings  @
@ are equal, case-sensitive @
@====================@@@@@@@@
@ Pre-Condition      @
@ R0: n/a            @
@ R1: String Pointer @
@ R2: String Pointer @
@====================@
@ Post-Condition     @
@ R0: boolean        @
@ R1: No Change      @
@ R2: No Change      @
@@@@@@@@@@@@@@@@@@@@@@
.global	string_equals
string_equals:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
equals  .req R0  @
strPtr1 .req R1  @
strPtr2 .req R2  @
char1   .req R3  @
char2   .req R4  @
@@@@@@@@@@@@@@@@@@
	push	{R1-R5}

	mov	equals,#1		@initialize boolean

loop:
	ldrb	char1,[strPtr1],#1	@load string1 character and post-increment
	ldrb	char2,[strPtr2],#1	@load string2 character and post-increment

	cmp	char1,char2		@compare the two characters
	movne	equals,#0		@if they aren't equal, return 0
	bne	exit

	cmp	char1,#0		@check if a character is \0
	beq	exit			@if it is a \0, exit

	b	loop

exit:
	pop	{R1-R5}
	bx	LR
.end

