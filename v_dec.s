@@@@@@@@@@@@@@@@@@@@@@@@
@ Displays a number in @
@ decimal (base 10)    @
@================@@@@@@@
@ Pre-Condition  @
@ R0: Number     @
@================@
@ Post-Condition @
@ R0: --         @
@@@@@@@@@@@@@@@@@@
.data
pow10:	.word	1		@10^0
	.word	10
	.word	100
	.word	1000		@10^3 (thousand)
	.word	10000
	.word	100000
	.word	1000000		@10^6 (million)
	.word	10000000
	.word	100000000
	.word	1000000000	@10^9 (billion)
	.word	0x7FFFFFFF	@largest integer in 31bits
dig:	.ascii	"0123456789"	@digits
msign:	.ascii	"-"
comma:	.ascii	","

.global v_dec
v_dec:
@@@@@@@@@@@@@@@@@@@@
@ Register Aliases @
outcode .req R0	   @ 1
strptr  .req R1	   @ ptr to "0123456789" string
outsize .req R2	   @ 1
inword  .req R3	   @ number to output
svccode .req R7	   @ 4
digcnt  .req R9    @ number of digits
@@@@@@@@@@@@@@@@@@@@
	push	{R0-R7}
	
@load all const registers
	mov	inword,R0	@copy of input word
	mov	outsize,#1	@output size
	mov	outcode,#1	@code for output
	mov	svccode,#4	@svc code to write string
	mov	digcnt,#1	@initialize digit count


@if bit 31 is set, register is a negative number
@should output a '-'
	cmp	inword,#0	@inword - 0 and set flags
	bge	absval		@branch if inword > 0


@output a minus sign and get make inword = abs(inword)
	ldr	strptr,=msign	@load R1 with address of lpar
	svc	0		@output
	rsb	inword,inword,#0@0 - inword


@we now have a number >= 0
absval:	cmp	inword,#10	@inworld - 10 and set flags
	blt	onecol		@branch if inword has 1 column
	

@get the highest power of ten this number will use
@(is it greater than 10?, 100?, ...)
	ldr	R6,=pow10+8	@point to hundred's column of
				@power of ten table
high10:	ldr	R5,[R6],#4	@load next higher power of ten
	cmp	R3,R5		@test if we reached highest
				@power of ten needed
	add	digcnt,#1	@digit count++
	bge	high10		@continue if its not
	sub	R6,#8		@we went two integers too faar
	b	nxtdec2


nxtdec:	ldr	R1,=comma
	sub	R9,#1
	mov	R10,R9


mod3:	subs	R10,#3
	bge	mod3
	adds	R10,#3
	svceq	0


nxtdec2:ldr	strptr,=dig-1	@point to 1 byte before
				@"0123456789" string
	ldr	R5,[R6],#-4	@load next lower power of 10
				@(mov right 1 dec column)


@loop through the next base10 digit column to display
mod10:	add	strptr,#1	@strptr += 1
	subs	inword,R5	@count down to find digit
	bge	mod10		@keep subtracting current
				@decimal column value
	addlt	inword,R5	@if we go negative add it back
	svc	0		@output

	cmp	R5,#10		@check if we gone to 1's col
	bgt	nxtdec		@if 1's col, go output
				@rightmost digit and return


onecol:	ldr	strptr,=dig	@point to digit string
	add	strptr,inword	@offset the ptr
	svc	0		@output


	pop	{R0-R7}
	bx	LR
.end

