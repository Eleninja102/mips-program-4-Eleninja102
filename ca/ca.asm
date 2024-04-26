# Author: Coleton Watt
# Date: November 7, 2022
# Description:  Manipulation of IEE numbers splits into parts and prints 

.macro print_str (%string)
	la    $a0, %string
	li    $v0, 4
	syscall
.end_macro

.globl read_float, print_sign, print_exp, print_significand, main			# Do not remove this line


# Data for the program goes here
.data

ieee: .word 0		# store your input here
again: .asciiz "Do you want to do it again?"
new_line: .asciiz "\n"
sieee:		.asciiz "\nIEEE-754 Single Prec: "
	
.text 				# Code goes here
main:
	# Task 2: Call read_float()
	jal read_float
	
	# Task 3: Call print_sign(ieee)
	lw $a0, ieee
	jal print_sign
	# Task 4: Call print_exp(ieee)
	lw $a0, ieee
	jal print_exp
	# Task 5: Call print_significand(ieee)
	
	lw $a0, ieee
	jal print_significand
	
	# Task 6: Print IEEE number in hex
	# print exponent with bias (hex)
	print_str sieee
	li $v0, 34 #print hex syscall
	lw $a0, ieee #print ieee in hex 32bit
	syscall 
	
	# Task 1: Try again pop-up
	print_str new_line
	li $v0, 50
	la $a0, again
	syscall 
	bne $a0, $0, exit_main
	j main
	
exit_main:
	li    $v0, 10		# 10 is the exit program syscall
	syscall			# execute call

## end of ca.asm

################################################################
# Procedure void read_float()
# Functional Description: Reads input from user using a pop up 
#  gui. It stores the capture value in ieee memory space
# Argument parameters: None
# Return Value: None
################################################################
# Register Usage:
.data 
prompt: .asciiz "Enter an IEEE 754 floating point number in decimal form: "
.text
read_float:
	li $v0, 52
	la $a0, prompt 
	syscall 
	 mfc1  $t0, $f0  # copy register $f0 to $t0
	 sw $t0, ieee #save $t0 into ieee
	 
	 li $v0, 2
	 lwc1  $f12, ieee #print ieee test not needed
	# syscall 
read_float_ret:
 jr $ra
 
 
 ################################################################
# Procedure void print_sign(ieee)
# Functional Description: Extracts the sign bit from the input param
#  and prints it to the screen with a corresponding message
# Argument parameters: 
#  $a0: ieee single precession value
# Return Value: None
# 
# Note: sign character: 0x2B = '+', 0x2D = '-'
################################################################
# Register Usage:
.data
	negativeSign: .asciiz "-"
	positiveSign: .asciiz "+"
	res_sign: .asciiz "\nThe sign is: "

.text
print_sign:
	 # The sing bit is the most significand bit. To isolate this bit you can use and AND to clear the other bits, then shift left 30 bits.
	move $t0, $a0
	andi $t1, $t0, 0x8000000
	
	srl $t1, $t0, 31 #shift bits left leaving one bit
	
	la $v0, 1
	move $a0, $t1
	#syscall  
	
	print_str res_sign  # print_str(res_sign)

ifPostive:
	beq $t1, 1, elseNegative #if $t1 == 1 jump (negative) else fall through
	print_str positiveSign  # print char +
	j endIf

elseNegative:
	print_str negativeSign   # print char -
	j endIf
endIf:

end_print_sign:
 jr    $ra




################################################################
# Procedure void print_exp(ieee)
# Functional Description: Extracts the exponent bits from the input param
#  and prints it to the screen with a corresponding message
# Argument parameters: 
#  $a0: ieee single precession value
# Return Value: None
################################################################
.data
	expoBias:	.asciiz "\nExpo with bias: "
	expoNoBias:	.asciiz "\nExpo without bias: "
.text
print_exp:
	move $t0, $a0
	
	andi $t1, $t0, 0x7F800000  # clear all but bits 30-23
 
	srl $t2, $t1, 23  # shift right 23 
 
 # subtract bias (hex)
 	sub $t3, $t2, 127
 	
 
 	print_str expoBias
 # print exponent with bias (hex)
 	li $v0, 34
 	move $a0, $t2
 	syscall 
 
 	print_str expoNoBias  # print_str(expoNoBias)

	 li $v0, 34
 	move $a0, $t3  # print exponent without bias (hex)
 	syscall 
end_print_exp:
 jr    $ra
 
 
 ################################################################
# Procedure void print_significand(ieee)
# Functional Description: Extracts the significand bits from the input param
#  and prints it to the screen with a corresponding message
# Argument parameters: 
#  $a0: ieee single precession value
# Return Value: None
################################################################
.data
	manti: .asciiz "\nMantissa: "
.text 
print_significand:

 	move $t0, $a0
 # clear all but bits 31-23
 	andi $t1, $t0, 0x007FFFFF
 	
 	li $v0, 4
 	la $a0, manti  # print_str(manti)
 	syscall 
 	#print_str manti
 	
  	li $v0, 34 #used to print int in hex
 	move $a0, $t1   # print significand  (hex)
 	syscall 
 
end_print_significand:
 jr    $ra
