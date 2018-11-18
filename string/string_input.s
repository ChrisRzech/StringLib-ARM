@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prompts for user input  @
@ and returns a cleaned   @
@ string                  @
@=========================@
@ Pre-condition           @
@ R1: String pointer      @
@ R2: Characters expected @
@=========================@
@ Post-condition          @
@ R1: String with input   @
@ R2: --                  @
@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global string_input
string_input:
	push	{R0,R2,R7}

	add	R2,#1		@add 1 to save room for \n
	mov	R0,#0	
	mov	R7,#3
	svc	0		@prompt input

	mov	R2,R1		@make a copy of the ptr
	sub	R0,#1		@decrement the input length by 1
	add	R2,R0		@increment the ptr by the input length
	mov	R0,#0		@we need a register to contain a 0
	strb	R0,[R2]		@store a \0 where the \n was

	pop	{R0,R2,R7}
	bx	LR
.end

