# Author:  Coleton Watt
# Date:  Oct 12, 2022
# Description: Functionsssss and inputss and have return values
.data
	ageStr: .asciiz "Hey, Coleton how old are you?\n"
	age: .asciiz "Coleton you are so old: \n"
	sum: .asciiz "The sum of the 2 input params is \n"
.text
	
	jal yourAge #int age = yourAge();
	move $s0, $v0 #save return value immeditaly $s0 = $v0
	
	#print age 
	li $v0, 1
	move $a0, $s0
	syscall 
	
	move $a0, $s0 #argument 0 = $s0
	jal helloAge #helloAge($s0);
	

	#int num3 = sum(num1, num2); return int
	li $a0, 10 #num1
	li $a1, 20 #num2
	jal sumFunction
	move $s1, $v0
	
	#print num3 
	li $v0, 1
	move $a0, $s1
	syscall
	
	
	j Exit



############
# int yourAge
#Aruments: None
#returns: int age
############ 
yourAge:
	li $v0, 4
	la $a0, ageStr #print ageStr
	syscall 
	
	#capute int 
	li $v0, 5 # $t0 = input int $v0
	syscall 
	move $t0, $v0

end_yourAge:
	# setReturn values
	move $v0, $t0
	jr $ra  #return to last place and return $v0


############
# void helloAge
#Aruments: int age $a0
#returns: none
############ 
helloAge:
	#get copy of $a0
	move $t0, $a0
	
	li $v0, 4
	la $a0, age #age Stringf
	syscall
	
	li $v0, 1
	move $a0, $t0 #pritn age
	syscall 


end_helloAge:
	jr $ra

############
# void sumFunction
#Aruments: int $a0, $a1
#returns: int $v0
############ 
sumFunction:
	move $t1, $a0
	move $t2, $a1
	
	add $t3, $t1, $t2  #num3 = num1 + num2
end_sumFunction:
	move $v0, $t3 # $v0 = num3
	jr $ra
	
Exit: 
	li $v0, 10		# 10 is the exit program syscall
	syscall		# execute 
end_Exit: