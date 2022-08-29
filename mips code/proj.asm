#subtracts two arrays w 10 elements
#int [] A = {10, 5, 6, 15, 17, 19, 25, 30, 12, 56};
#int [] B = {4, 15, 16, 5, 7, 9, 15, 10, 22, 6};
#put the results in int [] C = new int[10];
# for (int i = 0); i < A.length; i++)
#       C[i] = A[i] - B[i];
#       print("Result is " + print C)

.data
A:  .word   10, 5, 6, 15, 17, 19, 25, 30, 12, 56
B:  .word   4, 15, 16, 5, 7, 9, 15, 10, 22, 6
C:  .word   0, 0, 0, 0, 0, 0, 0, 0, 0, 0
length: .word   10
result:   .asciiz   "Result is "

.text
main:
#need addresses
la $t0, A  #address of A inside t0
la $t1, B  #same 
la $t3, C  #same
la $t4, C  #reserve address of first value in C for printing
        
li $t8, 0  #set i to 0 inside t8
la $t2, length #set t2 to address of length
lw $t7, 0($t2) #set t7 to integer-length
        
loop:
#read from A, read from B, store in C, compare, next
beq $t8, $t7, print #if i equals length, start printing Array C
lw $s0, 0($t0) #reading A[i]
lw $s1, 0($t1) #reading B[i]
sub $s3, $s0, $s1 # sub s0 and s1 and store in s3
sw $s3, 0($t3) #save value in s3 to $t3


addi $t0, $t0, 4 #increment to the next space in Array A
addi $t1, $t1, 4 #increment to next space in Array B
addi $t3, $t3, 4 #increment to next space in Array C
addi $t8, $t8, 1 #increase i
j loop


print:
li $t8, 0 #reset i to 0

#print the words "result is "
li $v0, 4
la $a0, result
syscall

loop2: 
#printing array C
beq $t8, $t7, exit #if i equals length, exit program
li $v0, 1 #syscall number to print value
lw $s4, 0($t4) #set value of current index in C to s4
move $a0, $s4
syscall
#print space
li $a0, 32
li $v0, 11
syscall
addi $t4, $t4, 4 #increment t4
addi $t8, $t8, 1 #increment i
j loop2

          
exit:
li $v0, 10
syscall