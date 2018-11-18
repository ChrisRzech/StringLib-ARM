@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Concatenates a string        @
@ at the end of another string @
@==================@@@@@@@@@@@@@
@ Pre-condition    @
@ R0: --           @
@ R1: String A     @
@ R2: String B     @
@==================@
@ Post-condition   @
@ R0: String A + B @
@ R1: --           @
@ R2: --           @
@@@@@@@@@@@@@@@@@@@@
.global string_concat
string_concat:
@@@@@@@@@@@@@@@@@@@@@
@ Register Alias    @
strConcat   .req R0 @
lengthTotal .req R0 @
str1        .req R1 @
str2        .req R2 @
char1       .req R3 @
char2       .req R4 @
tempLength  .req R5 @
@@@@@@@@@@@@@@@@@@@@@
	push	{R1-R5,LR}

	bl	string_length		@R0 = str1.length()
	mov	tempLength,R0
	push	{str1}			@save str1

	mov	R1,str2
	bl	string_length		@R0 = str2.length()
	add	lengthTotal,tempLength	@lengthTotal += tempLength
	pop	{str1}			@load str1

	bl	string_malloc		@R0 = strConcat
	push	{strConcat}		@save strConcat

str1_loop:
	ldrb	char1,[str1],#1
	
	cmp	char1,#0
	beq	str2_loop		@if(char1 == \0) move to next loop

	strb	char1,[strConcat],#1	@*strConcat = char1
	b	str1_loop

str2_loop:
	ldrb	char2,[str2],#1	

	cmp	char2,#0
	beq	return			@if(char2 == \0) return
	
	strb	char2,[strConcat],#1	@*strConcat = char2
	b	str2_loop

return:
	pop	{strConcat}		@load strConcat
	pop	{R1-R5,LR}
	bx	LR
.end

