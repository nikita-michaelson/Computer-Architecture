.data
array:	.word	2 4 7 8
length:	.word	5
found:	.word	0 	#where to store index of found
num:	.word	7	#number to find

.text
main:
la $a1, array	#address of array
lw $a2, length	#store array length
lw $a3, found 	#store index
lw $t4, num 	#store number to find

jal compare

li $v0,1		#code to print integer
move $a0, $a3	
syscall

li $v0, 10	#terminate program
syscall


compare:
li $t1, 0	#i=0
loop:
beq $t1, $a2, end 	# if i = length, break
lw $t2, 0($a1)		#read A[i]
bne $t2, $t4, cont	#if num != array[i], break and increment
addi $a3, $t1, 0		#put index into $a3
j end

cont:
addi $t1, $t1, 1 	#increment i 
addi $a1, $a1, 4		#advance arr ptr
j loop

end:
beq $a3, $zero, notFound		#if not found
sw $a3, found
jr $ra			#return to main 

notFound:
li $t1, -1
addi $a3, $t1, 0		#put index into $a3
sw $a3, found
jr $ra	

