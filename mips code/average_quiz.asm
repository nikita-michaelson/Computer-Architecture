.data
A:   .word   3  5  1  8
length: .word   4
sum:   .word   0
.text
main:

la $a1, A   		#address of array 
lw $a2, length  		#array length 
move $t0, $a1		#move arr address
move $t5, $a2

jal average		#jump to average procedure

li $v0,10		#exiting
syscall


average:

li $t1, 0 		#sum 

li $t2, 0 		#i = 0

loop:
beq $t2, 3 end  		#leave loop if i = length-1
lw $t4, 0($t0)		#$t4 has values at i in array 
add $t1, $t1, $t4	#sum = sum+arr[i]
addi $t2, $t2 , 1	#i+=1
addi $t0, $t0, 4 	#advancing array 
j loop

end: 
div $t6, $t1, $t5 	#average = sum/length
sw $t6, sum 		#save sum in sum var

jr $ra			#return to main


--------------------------------------------------------------

.data
A:	.word 		3  10  -5  -20  12
length:	.word		5
sum:	.word		0

.text
main:
la $a1,	A		#address of array
lw $a2,	length		#array length
move $t0, $a1		#move arr address
move $t5, $a2		#move arr length


jal sumOfNeg		#jump to sum of negatives procedure

li $v0, 1
move $v1, sum
move $a0, $v1

li $v0, 10		#exiting
syscall

sumOfNeg:
			#array address is $t0
li $t1, 0 		#sum
li $t2, 0		#i = 0

lw $t4,0($t0)		#$t4 holds arr[i]

loop:
beq $t2, $t5 end
blt $t4, $zero addNeg
addi $t2, $t2 , 1	#i+=1
addi $t0, $t0, 4 	#advancing array 
j loop

addNeg:
add $t1, $t1, $t4	#add arr[i] to sum var
addi $t2, $t2 , 1	#i+=1
addi $t0, $t0, 4 	#advancing array 
j loop

end:
sw $t1, sum 
jr $ra			#return to main



