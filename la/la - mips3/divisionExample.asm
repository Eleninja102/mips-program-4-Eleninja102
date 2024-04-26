# Author:  Coleton Watt
# Date:  Oct 12, 2022
# Description: Division stufff example

	#have user enter number print 0 if number is even
	#or print 1 if number is odd
.data 
	prompt: .asciiz "Input a number: \n"
	result: .asciiz "\nResult: 0 is even 1 is odd: "


.text

.globl main
main:
	
	jal getInt #s0 = getInt()
	move $s0, $v0 #saves output of getInt
	
	#check is number odd or even
	move $a0, $s0
	jal printEvenOdd #printEvenOdd($s0)
	
j Exit
#fun getInt() -> intput
getInt:
	li $v0, 4
	la $a0, prompt #print prompt
	syscall 
	
	li $v0, 5 #$v0 = input
	syscall 
	move $t0, $v0 #save


end_getInt:
	move $v0, $t0
	jr $ra
	

#fun printEvenOdd(int x) -> void
printEvenOdd:
	move $t4, $a0 #saves input arguments
	
	addi $t0, $zero, 2 #store 2 in $t0
	
	div $t1, $t4, $t0 #divide $s0 and 2 and save in $t1
	#division hi will store remainder and lo will store result
	
	mfhi $t2 #copy hi (reminder) to s1
	
	li $v0, 4
	la $a0, result #print result
	syscall 
	
	li $v0, 1
	move $a0, $t2 #print int 0 or 1
	syscall 
end_printEvenOdd:
	jr $ra
	

Exit:
	li $v0, 10		# 10 is the exit program syscall
	syscall		# execute 
end_Exit: