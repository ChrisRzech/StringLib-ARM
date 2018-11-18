@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the last          @
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
.global string_lastIndexOf_1
string_lastIndexOf_1:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
index    .req R0 @
string   .req R1 @
char     .req R2 @
charLoad .req R3 @
@@@@@@@@@@@@@@@@@@
	push	{R1-R3,LR}

	bl	string_length		@R0 = string.length()
	sub	index,#1		@index = string.length() - 1
	add	string,index		@string += index (starts at the end)

loop:
	ldrb	charLoad,[string],#-1

	cmp	index,#-1
	beq	not_found		@if(index == -1) not found

	cmp	charLoad,char
	beq	return			@if(charLoad == char) return

	sub	index,#1
	b	loop

not_found:
	bl	string_set_ovfl
	mov	index,#-1

return:
	pop	{R1-R3,LR}
	bx	LR	
.end
