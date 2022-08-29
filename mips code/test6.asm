# f=(g+h) + (i+k)
.data
str:.asciiz "My result is:  "
g:  .word 5
h:  .word 7
i:  .word 1
k:  .word 2
f:  .space 4

.text
main:
la $t0,g
la $t1,h
la $t3,i
la $t2,k
la $t4,f

lw $t5,0($t0)
lw $t6,0($t1)
add $s0, $t5,$t6
lw $t7,0($t3)
lw $t8,0($t2)
add $s1, $t8,$t7
add $s2,$s1,$s0

li $v0,4 # code for printing string
la $a0,str
syscall

li $v0,1  #code for printing integer
move $a0,$s2
syscall

sw $s2,0($t4)

li $v0,10
syscall
