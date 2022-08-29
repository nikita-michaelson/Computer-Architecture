.data

str:.asciiz "Result is:  "
A:    .word   10 5 6 15 17 19 25 30 12 56
B:    .word   4 15 16 5 7 9 15 10 22 6
C:    .word   0 0 0 0 0 0 0 0 0 0


.text
main:
la $t0,A  #$t0 = address of A array
la $t1,B  #$t1 = address of B array
la $t2,C  #$t2 = address of C array
li $s1,0  # i=0, counter
li $t3,10 # length of array

lw $s0, 0($t3) #$s0 has length of arr
li $s1,0  # i=0, counter

li $v0,4   # code for printing strings
la $a0,str
syscall

loop: beq $s1, $s0 exit
lw $s2,0($t0)  #reading A[i]
lw $s3,0($t1)  #reading B[i]
sub $s4,$s2,$s3 #C[i] = A[i] - B[i]
addi $t0, $t0, 4
addi $t1, $t1, 4
addi $t2, $t2, 4

addi $s1,$s1,1
j loop
exit:
li $v0,1 # code for printing ints
move $a0, $t2
syscall
