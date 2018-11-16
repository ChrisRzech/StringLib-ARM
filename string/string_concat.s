@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Concatenates a string        @
@ at the end of another string @
@=========================@@@@@@
@ Pre-condition           @
@ R0: --                  @
@ R1: String to add to    @
@ R2: String to add       @
@=========================@
@ Post-condition          @
@ R0: Concatenated string @
@ R1: --                  @
@ R2: --                  @
@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global string_concat
string_concat:
@@@@@@@@@@@@@@@@@@@@@
@ Register Alias    @
concatStr   .req R0 @
lengthTotal .req R0 @
str1        .req R1 @
str2        .req R2 @
char1       .req R3 @
char2       .req R4 @
tempStr     .req R5 @
tempLength  .req R6 @
@@@@@@@@@@@@@@@@@@@@@
	push	{R1-R6,LR}

	bl	string_length		@R0 = str1.length()
	mov	tempLength,R0		@tempLength = R0
	mov	tempStr,str1		@tempStr = str1

	mov	R1,str2			@R1 = str2
	bl	string_length		@R0 = str2.length()
	add	lengthTotal,tempLength	@lengthTotal += tempLength
	mov	str1,tempStr		@str1 = tempStr

	bl	string_malloc
	mov	tempStr,concatStr

str1_loop:
	ldrb	char1,[str1],#1	
	cmp	char1,#0
	beq	str1_loop_exit		@if(char1 == \0) exit loop

	strb	char1,[concatStr],#1	@*concatStr = char1
	b	str1_loop
str1_loop_exit:


@note: we want to store before comparing
@so that we can get a \0 into the string
str2_loop:
	ldrb	char2,[str2],#1	
	strb	char2,[concatStr],#1	@*concatStr = char2

	cmp	char2,#0
	beq	str2_loop_exit		@if(char2 == \0) exit loop

	b	str2_loop
str2_loop_exit:

exit:
	mov	concatStr,tempStr	@move the original pointer back in
	pop	{R1-R6,LR}
	bx	LR
.end

