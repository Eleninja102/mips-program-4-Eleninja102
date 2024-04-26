# Author:  Coleton Watt
# Date:  September 26 2022
# Description: Shifts the bits around and makes the rest of the code go brrr


.data
	greenStr: .asciiz "Green Light\n"
	blueStr: .asciiz "Blue Light\n"
	redStr: .asciiz "Red Light\n"
	offStr: .asciiz "Lights off\n"
	led_bits: .word 0x00F0
	doneStr: .asciiz "Lets goooo\n"
	partyStr: .asciiz "It's a party\n"
	inputs: .word 0xFA31 #rotate
	 .word 0xFA41 #blue
	 .word 0xFA51 #Green
	 .word 0xFA61 #RED
	 .word 0xFA01 #OFF

.text
main:
	#li $t0, 0x8BC2FA41 
	#shift
	#sll $s0, $t0, 8
	#rotate righ
	#ror $s1, $s0, 4	
	#Task select color
	lw $t2, led_bits
	#map bits 4-7 color 
	#if bits == 5 print blue
	#else if bits == 6 print red
	#else if  == 10 print green
	#else off 	
	li $t8, 0 #i = 0, loop counter 
	li $t7, 0 #array counter j = 0 j+=4
	li $t9, 5 #z = 5
Loop:  #for(i = 0; i < z; i++)
	beq $t8, $t9, End_loop
	
	lw $s0, inputs($t7)
	
	and $s0, $s0, $t2
	
	srl $s0, $s0, 4
	li $v0, 1
	move $a0, $s0
	#syscall 
	beq $s0, 0x3, Rotate
	beq $s0, 0x4, Red
	beq $s0, 0x5, Blue
	beq $s0, 0x6, Green
	j Off

Rotate:
	li $v0, 4
	la $a0, partyStr
	syscall 
Red:
	li $v0, 4
	la $a0, redStr
	syscall 
	bne $s0, 0x3, Increments #if s0 != 3 exirt
Blue:
	li $v0, 4
	la $a0, blueStr
	syscall 
	bne $s0, 0x3, Increments #if s0 != 3 exirt
Green:
	li $v0, 4
	la $a0, greenStr
	syscall 
j Increments  #jump done
Off:
	li $v0, 4
	la $a0, offStr
	syscall 
j Increments   #jump done

Increments:
	addi $t8, $t8, 1 #increment loop index 1
	add $t7, $t7, 4 #incpument array index 4 bits
j Loop
End_loop:
	li $v0, 4
	la $a0, doneStr
	syscall 

Exit: 
	li $v0, 10
	syscall
	
	
	
	
