# Author: Coleton Watt
# Date: 
# Description: 

.data  # Data used by the program



.text  # Instructions/code of the actual program

.globl main
main:


end_main:
	jal Exit

################################################################
# Procedure: void Exit()
# Functional Description: Exit the rprogram 
# Argument parameters: none
# Return Value: none
################################################################
Exit:
	#exit the program using syscall 10 - exit
	li $v0, 10
	syscall
End_Exit:
	j $ra

################################################################
# Procedure 
# Functional Description: 

# Argument parameters: 
# Return Value: 
################################################################
.data
.text
Function1:

End_Function1:
	jr $ra