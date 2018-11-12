@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the first occurrence @
@ of a specified substring.                 @
@ If the requested substring is not found   @
@ within the string, overflow flag is set   @
@ and 0 is returned.                        @
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
strPtr .req R1   @
subPtr .req R2   @
char   .req R3   @
index  .req R4   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4,LR}

	mov	index,#0		@initialize index

loop:
	ldrb	char,[strPtr]		@R0 = *strPtr
	cmp	char,#0			@if(R0 == \0) return
	beq	exit
	
	bl	string_startsWith_1
	cmp	found,#1		@if(found) return
	beq	exit

	add	strPtr,#1		@increment string ptr
	add	index,#1		@increment index
	b	loop

not_found:
	bl	string_set_ovfl
	mov	R0,#0
	b	exit

exit:
	mov	R0,index		@make sure we return the index

	pop	{R1-R4,LR}
	bx	LR
.end

