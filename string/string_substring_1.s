@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns a string that is a substring      @
@ between two indexes                       @
@                                           @
@ If the starting index is greater than the @
@ ending index or the starting/ending index @
@ is out of bounds, overflow flag is set    @
@ and NULL is returned                      @
@====================@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition      @
@ R0: --             @
@ R1: String         @
@ R2: Starting index @
@ R3: Ending index   @
@====================@
@ Post-condition     @
@ R0: Substring      @
@ R1: --             @
@ R2: --             @
@ R3: --             @
@@@@@@@@@@@@@@@@@@@@@@
.global string_substring_1
string_substring_1:
@@@@@@@@@@@@@@@@@@@@
@ Register Alias   @
substring  .req R0 @
string     .req R1 @
startIndex .req R2 @
index      .req R2 @
endIndex   .req R3 @
length     .req R4 @
charLoad   .req R4 @
@@@@@@@@@@@@@@@@@@@@
	push	{R1-R4,LR}

	bl	string_length		@R0 = string.length()
	mov	length,R0

	cmp	startIndex,endIndex
	bhi	bad_index		@if(startIndex > endIndex) bad index

	cmp	startIndex,length
	bhs	bad_index		@if(startIndex >= length) bad index

	cmp	endIndex,length
	bhs	bad_index		@if(endIndex >= length) bad index

	sub	R0,endIndex,startIndex	@R0 = startIndex + endIndex
	add	R0,#1			@R0 consists of indexes, we need string length
	bl	string_malloc		@R0 = address for substring

	add	string,startIndex	@offset the string by the starting index

	push	{substring}		@save substring

loop:
	ldrb	charLoad,[string],#1
	strb	charLoad,[substring],#1

	cmp	index,endIndex		@note: index = startIndex
	beq	return			@if(index == endIndex) return

	add	index,#1
	b	loop

bad_index:
	bl	string_set_ovfl
	mov	substring,#0		@substring = NULL

return:
	pop	{substring}		@load substring
	pop	{R1-R4,LR}
	bx	LR
.end

