@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prints a string ending @
@ with a null terminator @
@====================@@@@@
@ Pre-Condition      @
@ R1: String Pointer @
@====================@
@ Post-Condition     @
@ R1: No Change      @
@@@@@@@@@@@@@@@@@@@@@@
.global string_print
string_print:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
strPtr .req R1   @
length .req R2   @
@@@@@@@@@@@@@@@@@@
	push	{R0,R2,R7,LR}

	bl	string_length	@obtain string length

	mov	length,R0	@move the returned value
	mov	R0,#1		@code for stdout
	mov	R7,#4		@code for display
	svc	0		@service call

	pop	{R0,R2,R7,LR}
	bx	LR
.end
