.extern malloc

.global v_malloc
v_malloc:
	push	{R1-R3,R12,LR}

	bl	malloc

	pop	{R1-R3,R12,LR}
	bx	LR
.end
	
