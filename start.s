.data
string1:	.asciz	"0123123123\n"
error:		.asciz	"Error\n"

.text
.global	_start
_start:
<<<<<<< HEAD
	ldr	R1,=string1
	bl	string_print
	mov	R2,#'A'
	mov	R3,#'0'
	bl	string_replace
	bl	string_print
	
=======
	mov	R2,#10
	mov	R3,#'\0'
	ldr	R1,=string1
	bl	string_indexOf_2
	bl	v_dec
>>>>>>> 0039662ba81a16e214b33e888ed6bc3c89ac1da0

	mov	R7,#1
	svc	0
.end

