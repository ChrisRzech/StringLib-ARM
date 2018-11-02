.data
string1:	.asciz	"Hello World.\n"
string2:	.asciz	"Hello World.\n"
string3:	.asciz	"Hi World.\n"
endl:		.asciz	"\n"


.text
.global	_start
_start:
@output string1 and string2
	ldr	R1,=string1
	bl	string_print
	ldr	R1,=string2
	bl	string_print
@check if they are equal and output 0 or 1
	ldr	R1,=string1
	ldr	R2,=string2
	bl	string_equals
	bl	v_dec


@output endl
	ldr	R1,=endl
	bl	string_print
	bl	string_print
	bl	string_print


@output string1 and string2
	ldr	R1,=string1
	bl	string_print
	ldr	R1,=string3
	bl	string_print
@check if they are equal and output 0 or 1
	ldr	R1,=string1
	ldr	R2,=string3
	bl	string_equals
	bl	v_dec

@output endl
	ldr	R1,=endl
	bl	string_print

	mov	R7,#1
	svc	0
.end

