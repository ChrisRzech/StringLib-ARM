@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Checks if a string starts with @
@ a given substring starting at  @
@ a given index                  @
@====================@@@@@@@@@@@@@
@ Pre-condition      @
@ R0: --             @
@ R1: String         @
@ R2: Substring      @
@ R3: Starting index @
@====================@
@ Post-condition     @
@ R0: Boolean        @
@ R1: --             @
@ R2: --             @
@ R3: --             @
@@@@@@@@@@@@@@@@@@@@@@
.global string_startsWith_2
string_startsWith_2:
@@@@@@@@@@@@@@@@@@@@
@ Register Alias   @
found      .req R0 @
string     .req R1 @
substr     .req R2 @
startIndex .req R3 @
length     .req R4 @
index      .req R5 @
@@@@@@@@@@@@@@@@@@@@
	push	{R1-R5,LR}

	bl	string_length
	mov	length,R0

	cmp	startIndex,length
	bhs	bad_index		@if(startIndex >= length) bad index

	add	string,startIndex	@start the string at the starting index
	mov	index,#0
	
loop:
	ldrb	R0,[string]

	cmp	R0,#0
	beq	return			@if(R0 == \0) return

	bl	string_startsWith_1	@R0 = starts with it or not
	
	cmp	found,#1
	beq	return			@if(found) return

	add	string,#1
	b	loop

bad_index:
	bl	string_set_ovfl
	mov	found,#0

return:
	pop	{R1-R5,LR}
	bx	LR
.end

