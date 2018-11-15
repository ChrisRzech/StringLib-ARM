@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Allocates enough space @
@ for a string given the @
@ size needed  and       @
@ returns the address    @
@===================@@@@@@
@ Pre-condition     @
@ R0: String Length @
@===================@
@ Post-condition    @
@ R0: Address       @
@@@@@@@@@@@@@@@@@@@@@
.extern malloc

.global string_malloc
string_malloc:
	push	{R1-R3,R12,LR}

	add	R0,#1		@reserve space for \0
	bl	malloc

	pop	{R1-R3,R12,LR}
	bx	LR
.end
	
