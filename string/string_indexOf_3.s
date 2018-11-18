@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the first occurrence @
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
.global string_indexOf_3
string_indexOf_3:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
found  .req R0   @
string .req R1   @
substr .req R2   @
char   .req R3   @
index  .req R4   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4,LR}

	mov	index,#0		@initialize index

loop:
	ldrb	char,[string]

	cmp	char,#0
	beq	not_found		@if(R0 == \0) not found
	
	bl	string_startsWith_1
	cmp	found,#1
	beq	return			@if(found) return

	add	string,#1
	add	index,#1
	b	loop

not_found:
	bl	string_set_ovfl
	mov	index,#-1

return:
	mov	R0,index		@make sure we return the index

	pop	{R1-R4,LR}
	bx	LR
.end

