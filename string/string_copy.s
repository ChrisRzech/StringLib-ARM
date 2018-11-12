@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Creates a new string that is  @
@ identical to the input string @
@================@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ R0: --         @
@ R1: String     @
@================@
@ Post-condition @
@ R0: New string @
@ R1: --         @
@@@@@@@@@@@@@@@@@@
.global string_copy
string_copy:
@@@@@@@@@@@@@@@@@@
@ Register Alias @
newStr .req R0   @
string .req R1   @
length .req R2   @
char   .req R3   @
@@@@@@@@@@@@@@@@@@
	push	{R1-R3,LR}

	
