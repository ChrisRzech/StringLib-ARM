@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Checks whether a string is @
@ equal to another string.   @
@ Not case-sensitive         @
@================@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String A   @
@ R2: String B   @
@================@
@ Post-condition @
@ R0: Boolean    @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_equalsIgnoreCase
string_equalsIgnoreCase:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
equal    .req R0 @
copy     .req R0 @
str1     .req R1 @
str1Copy .req R1 @
str2     .req R2 @
str2Copy .req R2 @
@@@@@@@@@@@@@@@@@@
	push	{R1,R2,LR}

	bl	string_copy		@R0 = copy(str1)
	mov	str1Copy,copy
	bl	string_toLowerCase	@str1Copy is lowercased
	push	{str1Copy}		@save str1Copy

	mov	R1,str2
	bl	string_copy		@R0 = copy(str2)
	mov	R1,copy
	bl	string_toLowerCase	@str2Copy is lowercased
	mov	str2Copy,R1		@str2Copy = R1
	pop	{str1Copy}		@load str1Copy

	bl	string_equals		@R0 = str1Copy == str2Copy

	pop	{R1,R2,LR}
	bx	LR
.end
		
