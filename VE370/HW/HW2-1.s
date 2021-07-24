LOOP: 	slt $t2, $zero, $t0
	bne $t2, $zero, ELSE
	j DONE
ELSE: 	addi $s2, $s2, 2
	addiu $t0, $t0, 1
	j LOOP
DONE: