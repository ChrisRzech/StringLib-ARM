@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Checks if a string starts @
@ with a given substring    @
@================@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@ R2: Substring  @
@================@
@ Post-condition @
@ R0: Boolean    @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_startsWith_1
string_startsWith_1:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
found  .req R0   @
string .req R1   @
substr .req R2   @
char1  .req R3   @
char2  .req R4   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4}

	mov	found,#0	@initialize found

loop:
	ldrb	char1,[string],#1
	ldrb	char2,[substr],#1

	cmp	char2,#0	@if(char2 == \0) exit
	moveq	found,#1
	beq	exit

	cmp	char1,#0	@if(char1 == \0) exit
	beq	exit

	cmp	char1,char2	@if(char1 != char2) exit
	bne	exit

	b	loop

exit:
	pop	{R1-R4}
	bx	LR
.end

