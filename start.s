.data
string1:	.asciz	"0123123123\n"
error:		.asciz	"Error\n"

.text
.global	_start
_start:
	ldr	R1,=string1
	bl	string_print
	mov	R2,#'A'
	mov	R3,#'0'
	bl	string_replace
	bl	string_print
	

	mov	R7,#1
	svc	0
.end

