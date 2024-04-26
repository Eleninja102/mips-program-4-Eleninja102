# Author:  Coleton Watt
# Date:  September 26 2022
# Description: Conditional if etc.
.data


.text
	li $t0, 0xa #$t0 = g
	li $t1 0xb #t1 = h
	#$t3 = f
	#pseucode 
	#if(1==j) f=g+h
	#else f=g-h
	beq $t0, $t1, IF1
	sub $t3, $t0, $t1 # t3 = t0 - t1
	j CONT1
	
	
IF1:
	add $t3, $t0, $t1 #t3 = t0 + t1
	
CONT1:


#Another way
	bne $t0, $t1, IF2
	add $t3, $t0, $t1 # t3 = t0 + t1
	j CONT2
IF2: 
	sub $t3, $t0, $t1 # t3 = t0 - t1
CONT2:	


exit:
	li $v0, 10	
	syscall