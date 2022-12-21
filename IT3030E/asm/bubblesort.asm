## Bubble sort implementation

.data
array1: .word 7 6 5 4 3 2 1 ##save value
Message1: .asciiz "Please enter the EXACT number of elements in the array (must be correct!): "
Message2: .asciiz "This is your original array: "
Message3: .asciiz "This is the new sorted array (in non-decreasing order): "

.text
save: ##backup data at s0, s1
    addi $sp, $sp, -8
    sw $s0, 4($sp)
    sw $s1, 0($sp) ##count
    li $v0, 4
    la $a0, Message1
    syscall ##print a friendly message
    li $v0, 5
    syscall ##now input no. of elements
    la $s1, ($v0)
    addi $s0, $s1, -1

ARRAY_PRINT1:
    li $t3, 0
    la $t0, array1
    li $v0, 4
    la $a0, Message2
    syscall
loop1:
    lw $t2, 0($t0) ## load value
    li $v0, 1
    la $a0, ($t2)
    syscall ##print value from address
    addi $t3,$t3,1   #count number
    addi $t0, $t0, 4 ## new address 1
    beq  $t3,$s1,SORT    #if i == n, finish
    li $v0, 11
    li $a0, ',' ## separate values
    syscall
    j loop1
SORT:
    li $v0, 11
    la $a0, '\n'
    syscall
prep:
    la $t0, array1
    addi $t1, $t0, 4
    li $t2,0
    li $t3,0
    li $t4,0
    li $t5,0
    li $t6,0
    li $t7,0
    lw $t2, 0($t0) ## get array1[0] value
    lw $t3, 0($t1) ## get array1[1] value
main:
    loop2:
    blt $t2, $t3, neq ##change to bgt if you want non-increasing array
    sw $t3, 0($t0) ## value t1 to t0
    sw $t2, 0($t1) ## value t0 to t1
    addi $t6, $zero, 1
    continue:
    addi $t1, $t1, 4
    addi $t0, $t0, 4
    addi $t7, $t7, 1
    beq $t7, $s0, exceed
    lw $t2, 0($t0)
    lw $t3, 0($t1)
    j loop2
    
exceed:
    beq $t6, 0, ARRAY_PRINT2
    li $t7, 0
    li $t6, 0
    la $t0, array1
    addi $t1, $t0, 4
    lw $t2, 0($t0)
    lw $t3, 0($t1)
    j loop2

ARRAY_PRINT2:
    li $t3, 0
    la $t0, array1
    li $v0, 4
    la $a0, Message3
    syscall
loop2:
    lw $t2, 0($t0) ## load value
    li $v0, 1
    la $a0, ($t2)
    syscall
    addi $t3,$t3,1   #count number
    addi $t0, $t0, 4 ## new address 1
    beq  $t3,$s1,finish    #if i == n, finish
    li $v0, 11
    li $a0, ',' ## separate values
    syscall
    j loop2
    
finish:
    lw $s0, 4($sp)
    lw $s1, 0($sp)
    addi $sp, $sp, 8
    li $v0, 10
    syscall
    
neq:
    j continue