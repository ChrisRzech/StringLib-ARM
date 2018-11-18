@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the first occurrence @
@ of a specified character starting at a    @
@ given index                               @
@                                           @
@ If the requested character is not found   @
@ within the string, overflow flag is set   @
@ and -1 is returned                        @
@====================@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition      @
@ R0: --             @
@ R1: String         @
@ R2: Character      @
@ R3: Starting Index @
@====================@
@ Post-condition     @
@ R0: Index          @
@ R1: --             @
@ R2: --             @
@ R3: --             @
@@@@@@@@@@@@@@@@@@@@@@
.global string_indexOf_2
string_indexOf_2:
@@@@@@@@@@@@@@@@@@@@
@ Register Alias   @
index      .req R0 @
length     .req R0 @
string     .req R1 @
startIndex .req R3 @
@@@@@@@@@@@@@@@@@@@@
	push	{R1,R3,LR}

	bl	string_length		@R0 = string.length()

	cmp	startIndex,length
	bhs	bad_index		@if(startIndex >= length) bad index		

	add	string,startIndex	@string += startIndex
	
	bl	string_indexOf_1	@R0 = result
	b	return

bad_index:
	bl	string_set_ovfl
	mov	index,#-1

return:
	pop	{R1,R3,LR}
	bx	LR
.end
