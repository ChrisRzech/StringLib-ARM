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
maxIndex   .req R4 @
charLoad   .req R4 @
@@@@@@@@@@@@@@@@@@@@
	push	{R1-R4,LR}

	bl	string_length
	sub	maxIndex,R0,#1		@maxIndex = string.length() - 1

	cmp	startIndex,endIndex
	bhi	bad_index		@if(startIndex > endIndex) bad index

	cmp	startIndex,maxIndex
	bhi	bad_index		@if(startIndex > maxIndex) bad index

	cmp	endIndex,maxIndex
	bhi	bad_index		@if(endIndex > maxIndex) bad index

	sub	R0,endIndex,startIndex	@R0 = startIndex + endIndex
	add	R0,#1			@R0 consists of indexes, we need string length
	bl	string_malloc		@R0 = address for substring

	add	string,startIndex	@string += startIndex

	push	{substring}		@save the substring address

loop:
	ldrb	charLoad,[string],#1
	strb	charLoad,[substring],#1

	cmp	index,endIndex
	beq	exit			@if(index == endIndex) return

	add	index,#1
	b	loop

bad_index:
	bl	string_set_ovfl
	mov	substring,#0		@substring = NULL
	b	exit

exit:
	pop	{R0-R4,LR}
	bx	LR
.end

