@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the last 	 @
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
.global string_lastIndexOf_1
string_lastIndexOf_1:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
index 	.req R0  @
chLoad	.req R0	 @
strPtr	.req R1	 @
char	.req R2  @
count	.req R4	 @
length  .req R4  @
@@@@@@@@@@@@@@@@@@
	push	{R1-R3,LR}

	bl	string_length
	mov	length,R0
	
	sub	length,#1
	add	strPtr,length

loop:
	ldrb	chLoad,[strPtr]
	cmp	chLoad,#0
	beq	not_found
	sub	strPtr,#1

	cmp	chLoad,char
	beq	exit_loop
	sub	length,#1

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
	pop	{R1-R3,LR}
	bx	LR	
.end
