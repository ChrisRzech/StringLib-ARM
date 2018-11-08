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
index  .req R3   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R3,LR}

	mov	index,#0	@initialize index

loop:	
	bl	substr_exists
	add	strPtr,#1	@increment string ptr
	cmp	found,#1
	beq	exit		@if(found) return

	ldrb	R0,[strPtr]	@R0 = *strPtr
	cmp	R0,#0		
	beq	exit		@if(R0 == \0) return

	add	index,#1	@increment index
	b	loop

exit:
	mov	R0,index
	pop	{R1-R3,LR}
	bx	LR




substr_exists:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
exists .req R0   @
strPtr .req R1   @
subPtr .req R2   @
char1  .req R3   @
char2  .req R4   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R4}
	
	mov	exists,#1

substr_loop:
	ldrb	char1,[strPtr],#1
	ldrb	char2,[subPtr],#1

	cmp	char1,char2
	bne	check_null

	cmp	char2,#0
	beq	substr_exit

check_null:
	cmp	char2,#0
	moveq	exists,#1
	beq	substr_exit
	b	substr_loop

substr_exit:
	pop	{R1-R4}
	bx	LR
.end

