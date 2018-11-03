@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns a character at a given index. @
@ If the requested index is larger than @
@ the string length, overflow flag is   @
@ set and \0 is returned.               @
@================@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@ R2: Index      @
@================@
@ Post-condition @
@ R0: Character  @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_charAt
string_charAt:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
char   .req R0   @
strPtr .req R1   @
index  .req R2   @
length .req R3   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R3,LR}

	bl	string_length		@obtain string length
	mov	length,R0		@move the length

	cmp	length,index		@if(length <= index) v-flag = 1;
	bcc	bad_index

loop:
	ldrb	char,[strPtr],#1	@load character
	cmp	index,#0
	beq	exit
	subs	index,#1		@decrement index
	b	loop

bad_index:
	mov	R0,#0x80000000
	subs	R0,#1			@Flags set: C V
	mov	R0,#2
	asrs	R0,#1			@Flags set: V
	mov	char,#0
	b	exit

exit:
	pop	{R1-R3,LR}
	bx	LR
.end

