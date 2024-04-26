# Author:  Coleton Watt
# Date:  Oct 12, 2022
# Description: Functionsssss
.data
	name: .asciiz "Coleton says Hellowwww World\n"
	age: .asciiz "Coleton you are 2 years old"
.text
	
	#call helloFunction 
	jal helloFunction #helloFunction();
	jal helloFunction #helloFunction();
	jal helloFunction #helloFunction();
	jal helloAge #helloFunction();

	j Exit
############
# Hello Function 
#Aruments: None
#returns: none
############

helloFunction:
	li $v0, 4
	la $a0, name
	syscall
	#jal helloAge TODO: how do I rember my address
end_helloFunction:
	 jr $ra  #return to main or wherver $ra is
	 

############
# Hello Function 
#Aruments: None
#returns: none
############ 
helloAge:
	li $v0, 4
	la $a0, age
	syscall
end_helloAge:
	 jr $ra  #return to main or wherver $ra is	 
	 
Exit: 
	li $v0, 10		# 10 is the exit program syscall
	syscall		# execute 
end_Exit: