.data
arrayA: .word 10 3 45 90 12
length : .word 5
max: .word 0
str:.asciiz "Largest  in  given  array  is:  "

.text
main:
la $s0, arrayA        #address of array
lw $s1, length   #store arr length
lw $s2, max      #store the max
li $s3,0         #i = 0
li $s4,0         #store
li $t0,0         #flag
li $t1,0         #counter

lw $t1, 0($s0)   #read A[i]
lw $s2, 0($s0)   #max = A[i]

loop: 
beq $s3, 4 exit  #if i = length - 1 then exit
lw $s4, 4($s0)   #$s4 = A[i+1]
slt $t0, $s2, $s4         #if A[i] < A[i+1]
beq $t0, 1 changeMax      #then go change the max
addi $s3, $s3, 1          #increment i 
addi $s0, $s0, 4          #advance pointer
j loop

changeMax: 
addi $s3, $s3, 1          #increment i 
addi $s0, $s0, 4          #advance pointer
lw $s2, 0($s0)            #make new max A[i+1]
j loop      

exit: 
li $v0,4 # code for printing string
la $a0,str
syscall

li $v0, 1
move $a0, $s2 #code for printing max
syscall
li $v0, 10 #terminate program
syscall