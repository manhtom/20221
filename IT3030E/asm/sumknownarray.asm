.data #in mem. init array+init value
A: .word 1,2,3,4,5,6,7,8,9,10

.text
la $t0, A ##base address from label
	
sum:
lw $t2, 0($t0) ##load new value from new address
addi $t0, $t0, 4 ##init new address
add $s0, $s0, $t2 #s0 saves the sum
addi $t1, $t1, 1 #keep count
bne $t1, 10, sum

exit:
li $a0, 1
la $v0, ($s0)
syscall
li $a0, 10
syscall
