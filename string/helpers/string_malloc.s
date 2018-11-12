@@@@@@@@@@@@@@@@@@@@@@@@@
@ Allocates a specified @
@ amounts of bytes and  @
@ returns the address   @
@================@@@@@@@@
@ Pre-condition  @
@ R0: n bytes    @
@================@
@ Post-condition @
@ R0: Address    @
@@@@@@@@@@@@@@@@@@
.extern malloc

.global string_malloc
string_malloc:
	push	{R1-R3,R12,LR}

	bl	malloc

	pop	{R1-R3,R12,LR}
	bx	LR
.end
	
