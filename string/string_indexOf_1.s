@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the first 	 @
@ occurrence of a specified character.   @
@ If the requested character isn't found @
@ within the string, the overflow flag	 @
@ is set and \0 is returned.		 @
@================@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@ R2: Character  @
@================@
@ Post-condition @
@ R0: Index      @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_indexOf_1
string_indexOf_1:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
index 	.req R0  @
chLoad	.req R0	 @
strPtr	.req R1	 @
char	.req R2  @
count	.req R3	 @
@@@@@@@@@@@@@@@@@@
	push 	{R1-R3}

	mov	count,#0
loop:
	ldrb	chLoad,[strPtr],#1	@load in a character (byte)
	cmp	chLoad,#0		@checks for end of string
	beq	not_found		@branches if the char isn't found at end of string

	cmp	chLoad,char		@checks for matching character
	beq	exit_loop		@exits the loop

	adds	count,#1		@increments count and loops
	b	loop

not_found:
	mov	R0,#0x80000000
	subs	R0,#1			@Flags set: C V
	mov	R0,#2
	asrs	R0,#1			@Flags set: V
	mov	count,#0		@count set to \0
	b	exit_loop		@Exits loop

exit_loop:
	mov	index,count		@sets the index and exits.
	pop	{R1-R3}
	bx	LR	
.end
