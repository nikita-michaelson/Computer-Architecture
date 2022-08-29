.data
numA:	.float	6.0
numB:	.float	5.5

.text
main:
l.s	$f0, numA
l.s	$f1, numB

c.lt.s	$f1, $f0 #numB < numA
bc1t	swap
j	end

swap:
mov.s $f2, $f0	#put A in temp
mov.s $f0, $f1	#put B in A
mov.s $f1, $f2	#put A in B

end:
li $v0, 10
syscall


