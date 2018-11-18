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
@@@@@@@@@@@@@@@@@@@@@@
@ Register Alias     @
string       .req R1 @
substr       .req R2 @
stringLength .req R3 @
startIndex   .req R3 @
substrLength .req R4 @
@@@@@@@@@@@@@@@@@@@@@@
	push	{R1-R6,LR}

	bl	string_length			@R0 = string.length()
	mov	stringLength,R0
	push	{string}			@save string

	mov	R1,substr
	bl	string_length
	mov	substrLength,R0
	pop	{string}			@load string

	cmp	substrLength,stringLength
	movhi	R0,#0				@if(substrLength > stringLength) return false
	bhi	return
	
	sub	stringLength,substrLength	@R3 = stringLength - substrLength
	bl	string_startsWith_2		@R0 = result

return:
	pop	{R1-R6,LR}
	bx	LR
.end

