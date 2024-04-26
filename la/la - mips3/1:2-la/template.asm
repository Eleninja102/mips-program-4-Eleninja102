# Author:
# Date: 
# Description: 

.data  # Data used by the program


.text  # Instructions/code of the actual program
.globl main
main:


exit:
	#exit the program using syscall 10 - exit
	li $v0, 10
	syscall
	
