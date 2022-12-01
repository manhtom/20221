## Code from 20204891. Thx ##

.data
    Message: .asciiz "Input a positive number: "
 
.text
    li $v0, 4
    la $a0, Message
    syscall
 
    li $v0, 5
    syscall
 
    move $t0, $v0
 
    li $t1, 1
    li $t2, 0
 
    loop:
        bgt $t1, $t0, end
        add $t2, $t2, $t1
        addi $t1, $t1, 1
        j loop
 
    end:
        li $v0, 1
        move $a0, $t2
        syscall
 
        li $v0, 10
        syscall
