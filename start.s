.data
string1:	.asciz	"0123456789\n"
error:		.asciz	"Error\n"

.text
.global	_start
_start:
	mov	R2,#10
	mov	R3,#'\0'
	ldr	R1,=string1
	bl	string_indexOf_2
	bl	v_dec

	mov	R7,#1
	svc	0
.end

