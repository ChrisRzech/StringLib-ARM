@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the first         @
@ occurrence of a specified character    @
@                                        @
@ If the requested character isn't found @
@ within the string, the overflow flag   @
@ is set and -1 is returned              @
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
index    .req R0 @
string   .req R1 @
char     .req R2 @
charLoad .req R3 @
@@@@@@@@@@@@@@@@@@
	push 	{R1-R3,LR}

	mov	index,#0

loop:
	ldrb	charLoad,[string],#1

	cmp	charLoad,#0
	beq	not_found		@if(chLoad == \0) not found

	cmp	charLoad,char
	beq	return			@if(chLoad == char) return

	adds	index,#1		@increments index
	b	loop

not_found:
	bl	string_set_ovfl
	mov	index,#-1

return:
	pop	{R1-R3,LR}
	bx	LR	
.end

