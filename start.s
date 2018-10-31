.data
string:	.asciz	"There are 20 characters in this string!!"

.text
.global	_start
_start:
	ldr	R1,=string
	bl	string_length

	mov	R7,#1
	svc	0
.end

