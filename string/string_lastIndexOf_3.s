@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the last  occurrence @
@ of a specified substring                  @
@                                           @
@ If the requested substring is not found   @
@ within the string, overflow flag is set   @
@ and -1 is returned                        @
@================@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@ R2: Substring  @
@================@
@ Post-Condition @
@ R0: Index      @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_lastIndexOf_3
string_lastIndexOf_3:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
found  .req R0   @
string .req R1   @
subing .req R2   @
char   .req R3   @
index  .req R4   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4,LR}

	bl	string_length		@R0 = string.length()
	sub	index,R0,#1		@index is now max index
	add	string,index		@offset string by max index

loop:
	ldrb	char,[string]

	bl	string_startsWith_1	@R0 = found or not
	cmp	found,#1
	beq	return			@if(found) return

	cmp	index,#-1
	beq	not_found		@if(index == -1) not found

	sub	string,#1
	sub	index,#1
	b	loop

not_found:
	bl	string_set_ovfl
	mov	index,#-1

return:
	mov	R0,index		@make sure we return the index

	pop	{R1-R4,LR}
	bx	LR
.end

