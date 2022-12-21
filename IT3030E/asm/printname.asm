##Code from 20209705. Thx##

.text
    li $v0, 4
    la $a0, greet
    syscall
    
    li $v0, 8
    la $a0, buffer
    li $a1, 20
    move $t0,$a0
    syscall
    
    li $v0, 4
    la $a0, greet1
    syscall
    
    move $a0, $t0
    syscall
  
.data    
    buffer: .space 20
    greet: .asciiz "Please enter your name: "
    greet1: .asciiz "Hello! "
