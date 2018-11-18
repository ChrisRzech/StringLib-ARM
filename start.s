.data
.equ	BUFSIZE,256

str1:	.space	BUFSIZE
str2:	.space	BUFSIZE
str3:	.space	BUFSIZE

Cat:		.asciz	"Cat"
hat:		.asciz	"hat"
eggs:		.asciz	"eggs"
in_the_hat:	.asciz	"in the hat."
space:		.asciz	" "

prompt1:	.asciz	"str1: "
prompt2:	.asciz	"str2: "
prompt3:	.asciz	"str3: "

part1:	.asciz	" 1. string lengths.  .  .  .  .  .  "
part2a:	.asciz	"2a. equals(str1,str3).  .  .  .  .  "
part2b:	.asciz	"2b. equals(str1,str1).  .  .  .  .  "
part3a:	.asciz	"3a. equalsIgnoreCase(str1,str3)  .  "
part3b:	.asciz	"3b. equalsIgnoreCase(str1,str2)  .  "
part4:	.asciz	" 4. copy(str1) .  .  .  .  .  .  .  "
part5:	.asciz	" 5. substring_1(str3,4,13) .  .  .  "
part6:	.asciz	" 6. substring_2(str3,7) .  .  .  .  "
part7:	.asciz	" 7. charAt(str2,4).  .  .  .  .  .  "
part8:	.asciz	" 8. startsWith_2(str1,11,\"Cat\")  .  "
part9:	.asciz	" 9. startsWith_1(str1,\"Cat\")  .  .  "
part10:	.asciz	"10. endsWith(str1,\"in the hat.\") .  "
part11:	.asciz	"11. indexOf_1(str2,'g') .  .  .  .  "
part12:	.asciz	"12. indexOf_2(str2,'g',9)  .  .  .  "
part13:	.asciz	"13. indexOf_3(str2,\"eggs\") .  .  .  "
part14:	.asciz	"14. lastIndexOf_1(str2,'g').  .  .  "
part15:	.asciz	"15. lastIndexOf_2(str2,'g',9) .  .  "
part16:	.asciz	"16. lastIndexOf_3(str2,\"egg\") .  .  "
part17:	.asciz	"17. replace(str1,'C','B')  .  .  .  "
part18:	.asciz	"18. toLowerCase(str1).  .  .  .  .  "
part19:	.asciz	"19. toUppwerCase(str1)  .  .  .  .  "
part20:	.asciz	"20. concat(str1,\" \" + str2).  .  .  "

.text
.global _start
_start:
	bl	zero_regs		@all registers = 0

@Input str1
	ldr	R1,=prompt1		@R1 = prompt1
	bl	string_print		@print prompt1
	ldr	R1,=str1		@R1 = str1
	mov	R2,#BUFSIZE		@max string size
	bl	string_input		@input into str1


@Input str2
	ldr	R1,=prompt2
	bl	string_print
	ldr	R1,=str2
	mov	R2,#BUFSIZE
	bl	string_input


@Input str3
	ldr	R1,=prompt3
	bl	string_print
	ldr	R1,=str3
	mov	R2,#BUFSIZE
	bl	string_input


	bl	v_endl
	bl	v_endl


@Part 1
	ldr	R1,=part1		@R1 = part1
	bl	string_print		@print part1

	ldr	R1,=str1		@R1 = str1
	bl	string_length		@R0 = str1.length()
	bl	v_dec			@print str1.length()
	bl	v_space			@output a space

	ldr	R1,=str2
	bl	string_length
	bl	v_dec
	bl	v_space

	ldr	R1,=str3
	bl	string_length
	bl	v_dec
	bl	v_endl


@Part 2a
	ldr	R1,=part2a		@R1 = part2a
	bl	string_print		@print part2a

	ldr	R1,=str1		@R1 = str1
	ldr	R2,=str2		@R2 = str2
	bl	string_equals		@R0 = str1 == str2
	bl	v_bool			@prints a boolean
	bl	v_endl


@Part 2b
	ldr	R1,=part2b		@R1 = part2b
	bl	string_print		@print part2b

	ldr	R1,=str1		@R1 = str1
	ldr	R2,=str1		@R2 = str1
	bl	string_equals		@R0 = str1 == str1
	bl	v_bool			@prints a boolean
	bl	v_endl


@Part 3a
	ldr	R1,=part3a		@R1 = part3a
	bl	string_print		@print part3a

	ldr	R1,=str1		@R1 = str1
	ldr	R2,=str3		@R2 = str3
	bl	string_equalsIgnoreCase	@R0 = str1 == str3 (ignore case)
	bl	v_bool			@prints a boolean
	bl	v_endl


@Part 3b
	ldr	R1,=part3b		@R1 = part3b
	bl	string_print		@print part3b

	ldr	R1,=str1		@R1 = str1
	ldr	R2,=str2		@R2 = str2
	bl	string_equalsIgnoreCase	@R0 = str1 == str2 (ignore case)
	bl	v_bool			@prints a boolean
	bl	v_endl


@Part 4
	ldr	R1,=part4		@R1 = part4
	bl	string_print		@print part4

	ldr	R1,=str1		@R1 = str1
	bl	string_copy		@R0 = copy(str1)
	mov	R1,R0			@R1 = copy(str1)
	bl	string_print		@print copy(str1)
	bl	v_endl


@Part 5
	ldr	R1,=part5		@R1 = part5
	bl	string_print		@print part5

	ldr	R1,=str3		@R1 = str3
	mov	R2,#4			@R2 = 4
	mov	R3,#13			@R3 = 13
	bl	string_substring_1	@R0 = str3.substr(4,13)
	mov	R1,R0			@R1 = R0
	bl	string_print		@print str3.substr(4,13)
	bl	v_endl


@Part 6
	ldr	R1,=part6		@R1 = part6
	bl	string_print		@print part6

	ldr	R1,=str3		@R1 = str3
	mov	R2,#7			@R2 = 7
	bl	string_substring_2	@R0 = str3.substr(7,str3.length() - 1)
	mov	R1,R0			@R1 = R0
	bl	string_print		@print R1
	bl	v_endl


@Part 7
	ldr	R1,=part7		@R1 = part7
	bl	string_print		@print part7

	ldr	R1,=str2		@R1 = str2
	mov	R2,#4			@R2 = 4
	bl	string_charAt		@R0 = str2[4]
	mov	R1,R0			@R1 = str2[4]
	bl	v_char			@prints str2[4]
	bl	v_endl


@Part 8
	ldr	R1,=part8		@R1 = part8
	bl	string_print		@print part8

	ldr	R1,=str1		@R1 = str1
	ldr	R2,=hat			@R2 = hat
	mov	R3,#11			@R3 = 11
	bl	string_startsWith_2	@R0 = result
	bl	v_bool			@print boolean
	bl	v_endl


@Part 9
	ldr	R1,=part9		@R1 = part9
	bl	string_print		@print part9

	ldr	R1,=str1		@R1 = str1
	ldr	R2,=Cat			@R2 = Cat
	bl	string_startsWith_1	@R0 = result
	bl	v_bool			@print boolean
	bl	v_endl


@Part 10
	ldr	R1,=part10
	bl	string_print

	ldr	R1,=str1
	ldr	R2,=in_the_hat
	bl	string_endsWith
	bl	v_bool
	bl	v_endl


@Part 11
	ldr	R1,=part11
	bl	string_print

	ldr	R1,=str2
	mov	R2,#'g'
	bl	string_indexOf_1
	bl	v_dec
	bl	v_endl


@Part 12
	ldr	R1,=part12
	bl	string_print

	ldr	R1,=str2
	mov	R2,#'g'
	mov	R3,#9
	bl	string_indexOf_2
	bl	v_dec
	bl	v_endl


@Part 13
	ldr	R1,=part13
	bl	string_print

	ldr	R1,=str2
	ldr	R2,=eggs
	bl	string_indexOf_3
	bl	v_dec
	bl	v_endl


@Part 14
	ldr	R1,=part14
	bl	string_print

	ldr	R1,=str2
	mov	R2,#'g'
	bl	string_lastIndexOf_1
	bl	v_dec
	bl	v_endl


@Part 15
	ldr	R1,=part15
	bl	string_print

	ldr	R1,=str2
	mov	R2,#'g'
	mov	R3,#9
	bl	string_lastIndexOf_2
	bl	v_dec
	bl	v_endl


@Part 16
	ldr	R1,=part16
	bl	string_print

	ldr	R1,=str2
	ldr	R2,=eggs
	bl	string_lastIndexOf_3
	bl	v_dec
	bl	v_endl


@Part 17
	ldr	R1,=part17
	bl	string_print

	ldr	R1,=str1
	mov	R2,#'C'
	mov	R3,#'B'
	bl	string_replace
	bl	string_print
	bl	v_endl


@Part 18
	ldr	R1,=part18
	bl	string_print

	ldr	R1,=str1
	bl	string_toLowerCase
	bl	string_print
	bl	v_endl


@Part 19
	ldr	R1,=part19
	bl	string_print

	ldr	R1,=str1
	bl	string_toUpperCase
	bl	string_print
	bl	v_endl


@Part 20
	ldr	R1,=part20
	bl	string_print

	ldr	R1,=str1
	ldr	R2,=space
	bl	string_concat

	mov	R1,R0
	ldr	R2,=str2
	bl	string_concat

	mov	R1,R0
	bl	string_print
	bl	v_endl


exit:
	mov	R7,#1
	svc	0
.end

