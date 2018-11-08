@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Returns the index of the first occurrence @
@ of a specified character starting at a    @
@ given index.                              @
@ If the requested character is not found   @
@ within the string, overflow flag is set   @
@ and 0 is returned.                        @
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
@@@@@@@@@@@@@@@@@@
@ Register Alias @
index    .req R0 @
chLoad   .req R0 @
strPtr   .req R1 @
strIndex .req R2 @
char     .req R3 @
count    .req R4 @
length   .req R5 @
@@@@@@@@@@@@@@@@@@
	push	{R1-R5,LR}

	bl	string_length
	mov	length,R0
	mov	count,strIndex

	cmp	length,strIndex
	bcc	error

	add	strPtr,strIndex
	
loop:
	ldrb	chLoad,[strPtr],#1
	cmp	chLoad,#0
	beq	error

	
	cmp	chLoad,char
	beq	exit_loop

	add	count,#1
	b	loop

error:
	mov	R0,#0x80000000
	subs	R0,#1			@Flags set: C V
	mov	R0,#2
	asrs	R0,#1			@Flags set: V
	mov	count,#0
	b	exit_loop

exit_loop:
	mov	index,count
	pop	{R1-R5,LR}
	bx	LR
.end
