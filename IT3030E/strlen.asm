## max allowable string length is 255. equivalent of size_t strlen(const char *str) in C

.data
string: .space 256
Message: .asciiz "Please enter the string: "
Message2: .asciiz "The length of the string is: "

.text
subi $sp, $sp, 4
sw $s0, 0($sp)
li $t0, 0
li $t1, 0
li $s0, 0
li $v0, 4
la $a0, Message
syscall
li $v0, 8
la $a0, string
la $a1, 256
syscall
la $t0, string

loop:
lb $t1, 0($t0)
beq $t1, '\n', finish
addi $s0, $s0, 1
addi $t0, $t0, 1
j loop

finish:
li $v0, 4
la $a0, Message2
syscall
li $v0, 1
la $a0, ($s0)
syscall
li $v0, 10
syscall
lw $s0, 0($sp)
addi $sp, $sp, 4