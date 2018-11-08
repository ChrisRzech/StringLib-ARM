.data
string1:	.asciz	"0123456789\n"
error:		.asciz	"Error\n"

.text
.global	_start
_start:

	ldr	R1,=string1
	mov	R2,#'5'
	mov	R3,#6
	bl	string_lastIndexOf_2
	bl	v_dec




	mov	R7,#1
	svc	0
.end

