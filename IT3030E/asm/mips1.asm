##
## input/output, conditionals, loop
##

li $v0, 5
syscall
add $t0, $zero, $v0 #move input from v0 to t0
bgt $t0, 2, multi2

# t0: input, t1: keep count, $s0, res
multi1:
addi $s0, $s0, 3
addi $t1, $t1, 1
beq $t1, $t0, exit
j multi1

multi2:
addi $s0, $s0, 5
addi $t1, $t1, 1
beq $t1, $t0, exit
j multi2

exit:
li $v0, 1
la $a0, ($s0)
syscall
