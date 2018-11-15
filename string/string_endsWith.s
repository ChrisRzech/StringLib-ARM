@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Checks whether a string    @
@ contains a substring that  @
@ is equal to another string @
@ at the end                 @
@================@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@ R2: Substring  @
@================@
@ Post-condition @
@ R0: Boolean    @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_endsWith
string_endsWith:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
found  .req R0   @
string .req R1   @
substr .req R2   @
char1  .req R3   @
char2  .req R4   @
strLng .req R5   @
subLng .req R6   @
@@@@@@@@@@@@@@@@@@
	push	{R0-R6,LR}

	mov	R6,string		@ Switching the substr with string
	mov	R1,substr

	bl	string_length		@ getting length of substr
	mov	subLng,R0

	mov	substr,R1		@ putting string and substr back
	mov	string,R6

	bl	string_length		@ getting length of string
	mov	strLng,R0
	mov	found,#0		@ setting found to false

	sub	strLng,subLng
	mov	R3,strLng
	bl	string_startsWith_2

	
exit:
	pop	{R0-R6,LR}
	bx	LR
.end

