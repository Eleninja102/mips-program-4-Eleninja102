# Author: Coleton Watt
# Date: 
# Description: Utilities that will be used

################################################################
# Procedure/Subprogram: void Exit()
# Functional Description: Exit the rprogram 
# Argument parameters: none
# Return Value: none
################################################################
.data
.text
Exit:
	#exit the program using syscall 10 - exit
	li $v0, 10
	syscall
End_Exit:
	jr $ra
	

################################################################
# Procedure/Subprogram: void printNewLine()
# Functional Description: print newline in terminal or console
# Argument parameters: none
# Return Value: none
################################################################
.data
 	_newLine: .asciiz "\n"
.text
printNewLine:
	li $v0, 4
	la $a0,  _newLine
	syscall 
end_printNewLine:
	jr $ra
	
	
	
################################################################
# Procedure/Subprogram: void printString(string $a0)
# Functional Description: print string
# Argument parameters: string to print
# $a0 = address to print
# Return Value: none
################################################################
.data
.text
printString:
	li $v0, 4 #print(string
	#$a0 already has the addresss
	syscall 
end_printString:
	jr $ra
	
	
	

################################################################
# Procedure: int readInt();
# Functional Description: get's an int value and returns it

# Argument parameters: none
# Return Value: int
################################################################
.data
.text
readInt:
	la $v0, 5
	syscall 
End_readInt:
	#v0, already has return string
	jr $ra
	
################################################################
# Procedure: void printInt
# Functional Description: printInt input

# Argument parameters: int
# Return Value: none
################################################################
.data
.text
printInt:
	li $v0, 1 #print(int)
	#$a0 already has the addresss
	syscall 
End_printInt:
	jr $ra
	
################################################################
# Procedure: int promptReturn(string)
# Functional Description: printInt input

# Argument parameters: int
# Return Value: none
################################################################
.data
.text
promptReturnInt:
	li $v0, 4 #print(string
	#$a0 already has the addresss
	syscall 
	
	la $v0, 5
	syscall 
End_promptReturnInt:
	#v0, already has return string
	jr $ra



