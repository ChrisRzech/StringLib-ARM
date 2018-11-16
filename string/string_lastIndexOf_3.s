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
count  .req R4   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4,LR}

	mov	index,#0		@initialize index
	
	bl	string_length		@R0 = string.length()
	mov	count,R0
	sub	count,#1
	add	string,count

loop:
	ldrb	char,[string]		@R0 = *string
	cmp	char,#0			@if(R0 == \0) return
	beq	exit
	
	bl	string_startsWith_1	@R0 = found or not
	cmp	found,#1		@if(found) return
	beq	exit

	sub	string,#1		@decrement string ptr
	sub	count,#1		@decrement index
	cmp	count,#0
	beq	not_found
	b	loop

not_found:
	bl	string_set_ovfl
	mov	count,#-1
	b	exit

exit:
	mov	R0,count		@make sure we return the index

	pop	{R1-R4,LR}
	bx	LR
.end

