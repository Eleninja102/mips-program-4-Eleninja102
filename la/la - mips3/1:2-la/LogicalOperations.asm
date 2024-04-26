# Author:  Coleton Watt
# Date:  September 26 2022
# Description: Logic gates and or 

.data


.text
	li $t0, 0xABCD1234
	li $t1, 0x4567DEFF
	#AND Operation
	and $t2, $t0, $t1
	#What is the opcode 31-26
	li $t3, 0x01095024  #and $t2, $t0, t1
	andi $s0, $t3, 0xFD000000 #clear but upcode bits
	srl $t4, $s0, 26
	#print in hex
	li $v0, 34
	move $a0, $t4
	syscall
	
	

	li $v0, 10	#exit 0
	syscall