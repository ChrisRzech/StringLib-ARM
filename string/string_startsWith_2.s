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
	sub	length,#1

	cmp	startIndex,length	@if(startIndex > length) then bad index
	bhi	bad_index

	add	string,startIndex	@start the string at the starting index
	mov	index,#0
	
loop:
	ldrb	R0,[string]		@if(R0 == \0) exit
	cmp	R0,#0
	beq	exit

	bl	string_startsWith_1
	
	cmp	found,#1
	beq	exit

	add	string,#1
	b	loop

bad_index:
	mov	R0,#0x80000000
	subs	R0,#1			@Flags set: C V
	mov	R0,#2
	asrs	R0,#1			@Flags set: V
	mov	found,#0
	b	exit

exit:
	pop	{R1-R5,LR}
	bx	LR
.end

