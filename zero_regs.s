@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Loads all registers with zeros @
@================@@@@@@@@@@@@@@@@@
@ Pre-condition  @
@ All: --        @
@================@
@ Post-condition @
@ All: 0         @
@@@@@@@@@@@@@@@@@@
.global zero_regs
zero_regs:
	mov	R0,#0
	mov	R1,#0
	mov	R2,#0
	mov	R3,#0
	mov	R4,#0
	mov	R5,#0
	mov	R6,#0
	mov	R7,#0
	mov	R8,#0
	mov	R9,#0
	mov	R10,#0
	mov	R11,#0
	mov	R12,#0
	bx	LR
.end

