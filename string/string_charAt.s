@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns a character at a given index  @
@                                       @
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
string .req R1   @
index  .req R2   @
length .req R3   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R3,LR}

	bl	string_length		@R0 = string.length()
	mov	length,R0

	cmp	index,length
	bhs	bad_index		@if(index >= length) bad index

	ldrb	char,[string,index]
	b	return

bad_index:
	bl	string_set_ovfl
	mov	char,#0

return:
	pop	{R1-R3,LR}
	bx	LR
.end

