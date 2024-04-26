# Author:  Coleton Watt
# Date:  September 26 2022
# Description: LOoops

.data
printCS: .asciiz "I love CS2810?\n"
done: .asciiz "Lets goooo\n"


.text
lw $v0, 4($at)
	li $t0, 5 #constant J
	li $t1, 0 #i
 	#psudiocode
 	#while (i < J) print(i love sc 281) ?
 	
 	bne  $t0, $t1, LOOP
 	
 LOOP:
 	li $v0, 4
 	la $a0, printCS
 	syscall 
 	addi $t1, $t1, 1
 	bne $t0, $t1, LOOP
 end_LOOP:
 li $v0, 4
 	la $a0, done
 	syscall 
 
 	
 	

exit:
	li $v0, 10	
	syscall