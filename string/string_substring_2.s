@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns a string that is a substring      @
@ starting from an index to the end         @
@                                           @
@ If the starting index is out of bounds    @
@ overflow flag is set and NULL is returned @
@====================@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition      @
@ R0: --             @
@ R1: String         @
@ R2: Starting index @
@====================@
@ Post-condition     @
@ R0: Substring      @
@ R1: --             @
@ R2: --             @
@@@@@@@@@@@@@@@@@@@@@@
.global string_substring_2
string_substring_2:
@@@@@@@@@@@@@@@@@@@@
@ Register Alias   @
substring  .req R0 @
string     .req R1 @
startIndex .req R2 @
endIndex   .req R3 @
@@@@@@@@@@@@@@@@@@@@
	push	{R3,LR}

	bl	string_length		@R0 = string.length()
	sub	endIndex,R0,#1		@endIndex = string.length() - 1

	bl	string_substring_1	@R0 = substring

	pop	{R3,LR}
	bx	LR
.end

