.data
A:	.word 		3  10  -5  -20  12
length:	.word		5
sum:	.word		0

.text
main:
la $a1,	A		#address of array
lw $a2,	length		#array length
la $t1, sum		#load sum

jal sumOfNeg		#jump to sum of negatives procedure


li $v0, 10		#exiting
syscall

sumOfNeg:
			#array address is $t0
li $t1, 0 		#sum
li $t2, 0		#i = 0


loop:
beq $t2, $a2 end
lw $t4,0($a1)		#$t4 holds arr[i]
blt $t4, $zero addNeg
addi $t2, $t2 , 1	#i+=1
addi $a1, $a1, 4 	#advancing array 
j loop

addNeg:
add $t1, $t1, $t4	#add arr[i] to sum var
addi $t2, $t2 , 1	#i+=1
addi $a1, $a1, 4 	#advancing array  
j loop

end:
sw $t1, sum 
jr $ra			#return to main
