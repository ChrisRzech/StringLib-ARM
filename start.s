.data
.equ	BUFSIZE,256
				@specific tests for this driver
str1:	.space	BUFSIZE		@"Cat in the hat."
str2:	.space	BUFSIZE		@"Green eggs and ham."
str3:	.space	BUFSIZE		@"cat in the hat."

Cat:		.asciz	"Cat"
hat:		.asciz	"hat."
eggs:		.asciz	"eggs"
in_the_hat:	.asciz	"in the hat."
space:		.asciz	" "

prompt1:	.asciz	"str1: "
prompt2:	.asciz	"str2: "
prompt3:	.asciz	"str3: "

part1:  .asciz	" 1. string lengths.  .  .  .  .  .  "
part2a: .asciz	"2a. equals(str1,str3).  .  .  .  .  "
part2b: .asciz	"2b. equals(str1,str1).  .  .  .  .  "
part3a: .asciz	"3a. equalsIgnoreCase(str1,str3)  .  "
part3b: .asciz	"3b. equalsIgnoreCase(str1,str2)  .  "
part4:  .asciz	" 4. copy(str1) .  .  .  .  .  .  .  "
part5:  .asciz	" 5. substring_1(str3,4,13) .  .  .  "
part6:  .asciz	" 6. substring_2(str3,7) .  .  .  .  "
part7:  .asciz	" 7. charAt(str2,4).  .  .  .  .  .  "
part8:  .asciz	" 8. startsWith_2(str1,11,\"hat.\") .  "
part9:  .asciz	" 9. startsWith_1(str1,\"Cat\")  .  .  "
part10: .asciz	"10. endsWith(str1,\"in the hat.\") .  "
part11: .asciz	"11. indexOf_1(str2,'g') .  .  .  .  "
part12: .asciz	"12. indexOf_2(str2,'g',9)  .  .  .  "
part13: .asciz	"13. indexOf_3(str2,\"eggs\") .  .  .  "
part14: .asciz	"14. lastIndexOf_1(str2,'g').  .  .  "
part15: .asciz	"15. lastIndexOf_2(str2,'g',9) .  .  "
part16: .asciz	"16. lastIndexOf_3(str2,\"egg\") .  .  "
part17: .asciz	"17. replace(str1,'C','B')  .  .  .  "
part18: .asciz	"18. toLowerCase(str1).  .  .  .  .  "
part19: .asciz	"19. toUppwerCase(str1)  .  .  .  .  "
part20: .asciz	"20. concat(str1,\" \" + str2).  .  .  "

.text
.global _start
_start:
	bl	zero_regs		@all registers = 0


@Input str1
	ldr	R1,=prompt1
	bl	string_print		@R1=string
	ldr	R1,=str1
	mov	R2,#BUFSIZE
	bl	string_input		@R1=string, R2=max length


@Input str2
	ldr	R1,=prompt2
	bl	string_print		@R1=string
	ldr	R1,=str2
	mov	R2,#BUFSIZE
	bl	string_input		@R1=stirng, R2=max length


@Input str3
	ldr	R1,=prompt3
	bl	string_print		@R1=string
	ldr	R1,=str3
	mov	R2,#BUFSIZE
	bl	string_input		@R1=string, R2=max length


	bl	v_endl
	bl	v_endl


@Part 1
	ldr	R1,=part1
	bl	string_print		@R1=string

	ldr	R1,=str1
	bl	string_length		@R0=length, R1=string
	bl	v_dec			@R0=decimal
	bl	v_space

	ldr	R1,=str2
	bl	string_length		@R0=length, R1=string
	bl	v_dec			@R0=decimal
	bl	v_space

	ldr	R1,=str3
	bl	string_length		@R0=length, R1=string
	bl	v_dec			@R0=decimal
	bl	v_endl


@Part 2a
	ldr	R1,=part2a
	bl	string_print		@R1=string

	ldr	R1,=str1
	ldr	R2,=str2
	bl	string_equals		@R0=equals, R1=strA, R2=strB
	bl	v_bool			@R0=boolean
	bl	v_endl


@Part 2b
	ldr	R1,=part2b
	bl	string_print		@R0=string

	ldr	R1,=str1
	ldr	R2,=str1
	bl	string_equals		@R0=equals
	bl	v_bool			@R0=boolean
	bl	v_endl


@Part 3a
	ldr	R1,=part3a
	bl	string_print		@R0=string

	ldr	R1,=str1
	ldr	R2,=str3
	bl	string_equalsIgnoreCase	@R0=equals, R1=strA, R2=strB
	bl	v_bool			@R0=boolean
	bl	v_endl


@Part 3b
	ldr	R1,=part3b
	bl	string_print		@R1=string

	ldr	R1,=str1
	ldr	R2,=str2
	bl	string_equalsIgnoreCase	@R0=equals, R1=strA, R2=strB
	bl	v_bool			@R0=boolean
	bl	v_endl


@Part 4
	ldr	R1,=part4
	bl	string_print		@R1=string

	ldr	R1,=str1
	bl	string_copy		@R0=copy, R1=string
	mov	R1,R0
	bl	string_print		@R1=string
	bl	v_endl


@Part 5
	ldr	R1,=part5
	bl	string_print		@R1=string

	ldr	R1,=str3
	mov	R2,#4
	mov	R3,#13
	bl	string_substring_1	@R0=substr, R1=string, R2=start, R3=end
	mov	R1,R0
	bl	string_print		@R1=string
	bl	v_endl


@Part 6
	ldr	R1,=part6
	bl	string_print		@R1=string

	ldr	R1,=str3
	mov	R2,#7
	bl	string_substring_2	@R0=substr, R1=string, R2=start
	mov	R1,R0
	bl	string_print		@R1=string
	bl	v_endl


@Part 7
	ldr	R1,=part7
	bl	string_print		@R1=string

	ldr	R1,=str2
	mov	R2,#4
	bl	string_charAt		@R0=char, R1=string, R2=index
	mov	R1,R0
	bl	v_char			@R1=char
	bl	v_endl


@Part 8
	ldr	R1,=part8
	bl	string_print		@R1=string

	ldr	R1,=str1
	ldr	R2,=hat
	mov	R3,#11
	bl	string_startsWith_2	@R0=boolean, R1=string, R2=substr, R3=start
	bl	v_bool			@R0=boolean
	bl	v_endl


@Part 9
	ldr	R1,=part9
	bl	string_print		@R1=string

	ldr	R1,=str1	
	ldr	R2,=Cat	
	bl	string_startsWith_1	@R0=boolean, R1=string, R2=substr
	bl	v_bool			@R0=boolean
	bl	v_endl


@Part 10
	ldr	R1,=part10
	bl	string_print		@R1=string

	ldr	R1,=str1
	ldr	R2,=in_the_hat
	bl	string_endsWith		@R0=boolean, R1=string, R2=substr
	bl	v_bool			@R0=boolean
	bl	v_endl


@Part 11
	ldr	R1,=part11
	bl	string_print		@R1=string

	ldr	R1,=str2
	mov	R2,#'g'
	bl	string_indexOf_1	@R0=index, R1=string, R2=char
	bl	v_dec			@R0=decimal
	bl	v_endl


@Part 12
	ldr	R1,=part12
	bl	string_print		@R1=string

	ldr	R1,=str2
	mov	R2,#'g'
	mov	R3,#9
	bl	string_indexOf_2	@R0=index, R1=string, R2=char, R3=start
	bl	v_dec			@R0=decimal
	bl	v_endl


@Part 13
	ldr	R1,=part13
	bl	string_print		@R1=string

	ldr	R1,=str2
	ldr	R2,=eggs
	bl	string_indexOf_3	@R0=index, R1=string, R2=substr
	bl	v_dec			@R0=decimal
	bl	v_endl


@Part 14
	ldr	R1,=part14
	bl	string_print		@R1=string

	ldr	R1,=str2
	mov	R2,#'g'
	bl	string_lastIndexOf_1	@R0=index, R1=string, R2=char
	bl	v_dec			@R0=decimal
	bl	v_endl


@Part 15
	ldr	R1,=part15
	bl	string_print		@R1=string

	ldr	R1,=str2
	mov	R2,#'g'
	mov	R3,#9
	bl	string_lastIndexOf_2	@R0=index, R1=string, R2=char, R3=start
	bl	v_dec			@R0=decimal
	bl	v_endl


@Part 16
	ldr	R1,=part16
	bl	string_print		@R1=string

	ldr	R1,=str2
	ldr	R2,=eggs
	bl	string_lastIndexOf_3	@R0=index, R1=string, R2=substr
	bl	v_dec			@R0=decimal
	bl	v_endl


@Part 17
	ldr	R1,=part17
	bl	string_print		@R1=string

	ldr	R1,=str1
	mov	R2,#'C'
	mov	R3,#'B'
	bl	string_replace		@R1=string, R2=oldChar, R3=newChar
	bl	string_print		@R1=string
	bl	v_endl


@Part 18
	ldr	R1,=part18
	bl	string_print		@R1=string

	ldr	R1,=str1
	bl	string_toLowerCase	@R1=string
	bl	string_print		@R1=string
	bl	v_endl


@Part 19
	ldr	R1,=part19
	bl	string_print		@R1=string

	ldr	R1,=str1
	bl	string_toUpperCase	@R1=string
	bl	string_print		@R1=string
	bl	v_endl


@Part 20
	ldr	R1,=part20
	bl	string_print		@R1=string

	ldr	R1,=str1
	ldr	R2,=space
	bl	string_concat		@R0=newString, R1=string, R2=substr

	mov	R1,R0
	ldr	R2,=str2
	bl	string_concat		@R0=newString, R1=string, R2=substr

	mov	R1,R0
	bl	string_print		@R1=string
	bl	v_endl


exit:
	mov	R7,#1
	svc	0
.end

