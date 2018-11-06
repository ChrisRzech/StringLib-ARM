.data
string1:	.asciz	"0123456789\n"
error:		.asciz	"Error\n"

.text
.global	_start
_start:
	@ldr	R1,=string1
	@bl	string_print
	
	mov	R2,#'A'
	ldr	R1,=string1
	bl	string_indexOf_1
	blvc	v_dec

	mov	R7,#1
	svc	0
.end

