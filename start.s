.data
string:	.asciz	"There are 40 characters in this string!!"

.text
.global	_start
_start:
	ldr	R1,=string
	bl	string_length
	bl	v_dec

	mov	R7,#1
	svc	0
.end

