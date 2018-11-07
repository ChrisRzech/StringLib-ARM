.data
string1:	.asciz	"0123456789\n"
error:		.asciz	"Error\n"

.text
.global	_start
_start:
	@ldr	R1,=string1
	@bl	string_print
	
	mov	R3,#'6'
	mov	R2,#3
	ldr	R1,=string1
	bl	string_indexOf_2
	blvc	v_dec

	mov	R7,#1
	svc	0
.end

