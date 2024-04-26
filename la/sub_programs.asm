# Author: Coleton Watt
# Date: 
# Description: subFunctions

.data  # Data used by the program

name: .asciiz "Helwo, Coleton"
prompt: .asciiz "Enter a number: "
answer: .asciiz "You entered: "

.text  # Instructions/code of the actual program

.globl main
main:
	la $a0, name #input $a0 = name
	jal printString #print($a0)
	jal printNewLine #print(\n)
	
	la $a0, prompt #input $a0 = name
	jal printString #print($a0)
	jal printNewLine #print(\n)
	
	jal readInt
	move $t0, $v0
	
	la $a0, answer #input $a0 = name
	jal printString #print($a0)

	
	move $a0, $t0
	jal printInt
	
	la $a0, prompt #input $a0 = prompt
	jal promptReturnInt
	move $t0, $v0
	
	move $a0, $t0
	jal printInt
	
end_main:
	jal Exit


#note: the file needs to be in the same file
.include "utilities.asm" #import #utilities.asm




