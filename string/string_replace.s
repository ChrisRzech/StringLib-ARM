@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Replaces all occurrences of a character @
@ with a new character.                   @
@================@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@ R2: Old Char   @
@ R3: New Char   @
@================@
@ Post-condition @
@ R0: New String @
@ R1: --         @
@ R2: --         @
@@@@@@@@@@@@@@@@@@
.global string_replace
string_replace:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
chLoad  .req R0  @
strPtr  .req R1  @
oldChar .req R2  @
newChar .req R3  @
@@@@@@@@@@@@@@@@@@
	push 	{R0-R3}

loop:
	ldrb	chLoad,[strPtr]		@ load string 

	cmp	chLoad,#0		@ compare to end of string
	beq	end_loop		@Branching because it is the end of the string

	cmp	chLoad,oldChar		@ compare current char to the char to change
	streqb	newChar,[strPtr]	@ change current char to the new char
	add	strPtr,#1		@ move to next char
	b	loop			@ loop
	
end_loop:
	pop 	{R0-R3}			@ Exit code
	bx	LR
.end
