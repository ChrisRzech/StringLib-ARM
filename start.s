.data
string1:	.asciz	"HELLO worlD!!@#&*(.\n"
endl:		.asciz	"\n"


.text
.global	_start
_start:
	ldr	R1,=string1
	bl	string_print
	bl	string_toLowerCase
	bl	string_print

	mov	R7,#1
	svc	0
.end

