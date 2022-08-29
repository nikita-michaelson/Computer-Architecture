.data
Array: .word 1, 5, 7, -10, -15
length: .word  5
sum: .word 0
average: .word 0
str: .asciiz "  "

.text
main:
la $t0, Array
lw $s0, length
li $s1,0 # i=0
li $s2,0  #sum=0

sumloop: beq $s0,$s1,exitloop

lw $s3,0($t0)
add $s2,$s2,$s3
addi $s1,$s1,1
addi $t0,$t0,4

j sumloop

exitloop:
sw $s2,sum
li $v0,1
move $a0,$s2
syscall

li $v0,4
la $t2,str
move $a0,$t2
syscall

div $s4,$s2,$s0
sw $s4,average
li $v0,1
move $a0,$s4
syscall
li $v0,10
syscall

