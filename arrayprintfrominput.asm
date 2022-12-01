ARRAY_PRINT:
    addi $sp, $sp, -8
    sw $s0, 4($sp)
    sw $s1, 0($sp)
    move $s0, $a0
    move $s1, $a1
    li $t0, 0
input:   
    sll    $t1,$t0,2        #t1=4*i   
    add    $t1,$t1,$s0        #t1 store the address of A[i]
    lw    $t2,0($t1)        #load value of A[i] in $t0
    li $v0, 1
    move $a0, $t2
    syscall
    addi $t0,$t0,1        #i++
    beq    $t0,$s1,finish_print    #if i == n, finish
    li $v0, 11
    li $a0, ','
    syscall
    j input
finish_print:
    lw $s0, 4($sp)
    lw $s1, 0($sp)
    addi $sp, $sp, 8
    jr $ra
