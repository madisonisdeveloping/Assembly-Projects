########## lab3 ################
# Author: Madison
# Description: This program adds together two integers.
# Initial Algorithm:
#   1. Prompt the user to enter the first integer.
#   2. Read the first integer from the user.
#   3. Prompt the user to enter the second integer.
#   4. Read the second integer from the user.
#   5. Add the first and second integers.
#   6. Display the sum of the two integers.
#   7. Display the author's name, date, and favorite number.
#   8. Terminate the program.
# Data Requirements
# Input Variables: Two integers
# Output Variables: Sum of the two integers.
# Addition Variables: None
# Formulas: None
# Refined Algorithm:
# 1. Prompt user for the first integer and read it.
# 2. Prompt user for the second integer and read it.
# 3. Add the two integers together.
# 4. Display the first integer.
# 5. Display "+"
# 6. Display the second integer.
# 7. Display "="
# 8. Display the sum.
# 9. Display the author's name, date, and favorite number.
# 10. Exit the program.
####################################
        .text
        .globl main
main:

la $a0, prompt 				#loads address of int prompt into a0
li $v0, 4				#indicates to display a string in v0
syscall					#print the int prompt

li $v0, 5                        	#load user prompted integer into v0
syscall                         	#system call to read the integer and store in v0
move $t0, $v0				#move the age from v0 to t0

la $a0, prompt2 			#loads address of int prompt into a0
li $v0, 4				#indicates to display a string in v0
syscall					#print the int prompt

li $v0, 5                        	#load user prompted integer into v0
syscall                         	#system call to read the integer and store in v0
move $t1, $v0				#move the age from v0 to t1

add $t2, $t1, $t0			#add the ints and store in $t2

move $a0, $t0              		#move int 1 into a0
li $v0, 1                  		#code for print integer
syscall                    		#print

la $a0, output				#" + " output
li $v0, 4				#
syscall					#printed to console.

move $a0, $t1              		#move int 2 into a0
li $v0, 1                  		#code for print integer
syscall                    		#print

la $a0, endl				#" = " output
li $v0, 4				#
syscall					#printed to console.

move $a0, $t2             		#move sum into a0
li $v0, 1                  		#code for print integer
syscall                    		#print

li $v0,10                       	#exit
syscall

#####data section######

.data

prompt: .asciiz "Enter an integer: " 	#prompt for integer
prompt2: .asciiz "Enter another integer: " #prompt for another integer
output: .asciiz " + "			#output message (part 1)
endl: .asciiz " = "			#output message (part 2)
######## Output ########
# Enter an integer: 29
# Enter another integer: 10
# 29 + 10 = 39