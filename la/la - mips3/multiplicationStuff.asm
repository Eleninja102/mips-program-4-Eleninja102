# Author:  Coleton Watt
# Date:  Oct 12, 2022
# Description: Multiplacation stufff example

.data 
	prompt: .asciiz "Input a number: \n"
	result: .asciiz "\nResult is:"


.text

	#int x = proment int cvalue for x
	#int y = (5*x*x)+(2*x)+3
	#print result 
	
	li $v0, 4
	la $a0, prompt #print prompt
	syscall 
	
	li $v0, 5 #get int input
	syscall 
	
	move $s0, $v0 #save Ss0 = x or $v0
	
	mul $t0, $s0, 5 #5*x
	mul $t0, $t0, $s0 #(5*x) *5
	
	mul $t1, $s0, 2 #(2*x)
	
	add $t0, $t0, $t1 # $t0 = $t0 + $t1
	
	addi $s1, $t0, 3 #$t0 = $t0 + 3
	
	li $v0, 4
	la $a0, result #print result
	syscall 
	
	li $v0, 1
	move $a0, $s1
	syscall 

Exit: 
	li $v0, 10		# 10 is the exit program syscall
	syscall		# execute 
end_Exit: