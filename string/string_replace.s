@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Replaces all occurrences of a character @
@ with a new character.                   @
@================@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ R1: String     @
@ R2: Old Char   @
@ R3: New Char   @
@================@
@ Post-condition @
@ R1: --         @
@ R2: --         @
@ R3: --         @
@@@@@@@@@@@@@@@@@@
.global string_replace
string_replace:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
charLoad .req R0 @
string   .req R1 @
oldChar  .req R2 @
newChar  .req R3 @
@@@@@@@@@@@@@@@@@@
	push 	{R0-R2}

loop:
	ldrb	charLoad,[string] 

	cmp	charLoad,#0
	beq	return			@if(charLoad == \0) return

	cmp	charLoad,oldChar
	streqb	newChar,[string]	@if(charLoad == oldChar) *string = newChar

	add	string,#1
	b	loop
	
return:
	pop 	{R0-R2}
	bx	LR
.end

