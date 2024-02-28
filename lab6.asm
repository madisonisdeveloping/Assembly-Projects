########## lab6 ################
# Author: Madison
# Description: Determines if an input integer is odd or even. The program displays a prompt for the user to enter an integer,
# determines if the input integer is odd or even, and prints a corresponding message. It also includes a signature message at the end.
# Initial Algorithm:
# 1. Display a prompt asking the user to enter an integer.
# 2. Read the input integer from the user.
# 3. Determine if the input integer is odd or even.
# 4. Print a message indicating whether the number is odd or even.
# 6. Terminate the program.
# Data Requirements
# Input Variables: $t0 (input integer)
# Output Variables: None
# Addition Variables: $t1 (quotient), $t2 (divisor), $t8 (comparison value for odd/even check)
# Formulas:
#  Remainder = input_integer % 2 (stored in $t0 after division)
#  Quotient = input_integer / 2 (stored in $t1 after division)
# Refined Algorithm:
# 1. Display a prompt asking the user to enter an integer.
#    - Load the address of the prompt string into register $a0.
#    - Set $v0 to 4 to indicate printing a string.
#    - Perform syscall to print the prompt.
# 2. Read the input integer from the user.
#    - Set $v0 to 5 to indicate reading an integer.
#    - Perform syscall to read the integer.
#    - Move the integer from $v0 to $t0 for further processing.
# 3. Determine if the input integer is odd or even.
#    - Load the integer 2 into register $t2.
#    - Load the integer 0 into register $t8 for comparison.
#    - Divide the input integer ($t0) by 2 ($t2).
#    - Use mfhi to store the remainder in $t0.
#    - Use mflo to store the quotient in $t1.
# 4. Print a message indicating whether the number is odd or even.
#    - If the remainder ($t0) is equal to 0, branch to the ELSE block.
#    - If the remainder is not 0, print the message for an odd number.
#      - Load the address of the output2 string into $a0.
#      - Set $v0 to 4 to indicate printing a string.
#      - Perform syscall to print the message.
#    - If the remainder is 0, execute the ELSE block.
#      - Print the message for an even number.
#        - Load the address of the output string into $a0.
#        - Set $v0 to 4 to indicate printing a string.
#        - Perform syscall to print the message.
# 5. Terminate the program.
#    - Set $v0 to 10 to indicate program termination.
#    - Perform syscall to exit the program.
####################################

        .text
        .globl main
main:

la $a0, prompt          #load address of int prompt into $a0
li $v0, 4               #indicate to display a string in $v0
syscall                 #print the prompt

la $t2, 2          	#load int of 2 into $t2
li $t8, 0        	#load int of 0 into $t8

li $v0, 5               #load user prompted integer into v0
syscall                 #system call to read the integer and store in v0
move $t0, $v0		#move int from v0 to t0

div $t0,$t2   		#Lo = $t0 / $t2 (Lo will contain the integer quotient), Hi = $t0 mod $t2 (Hi will contain the remainder)
mfhi $t0      		#move quantity in special register Hi to $t0:   $t0 = Hi
mflo $t1      		#move quantity in special register Lo to $t1:   $t1 = Lo

beq $t0, $t8, ELSE   	#IF t0=t8 then Branch to ELSE
move $a0,$t0         	#IF t0 DOES NOT give a remainder of zero, move t1->a0 to display
la $a0, output2         #load address of odd prompt into $a0
li $v0, 4               #indicate to display a string in $v0
syscall                 #print the odd prompt

j END                   #jump to the end to avoid executing the ELSE block when the number is even

ELSE:  move $a0,$t1  	#ELSE move t1 -> a0 for display
la $a0, output          #load address of even prompt into $a0
li $v0, 4               #indicate to display a string in $v0
syscall                 #prints the message for even numbers

END:                    #end of conditionals

li $v0,10               #exit
syscall

#####data section######

.data

prompt: .asciiz "Enter an integer: " 										#prompt for int
output: .asciiz "The number you entered is even." 								#output for even number
output2: .asciiz "The number you entered is odd." 								#output for odd number

######## Output ########
#Enter an integer: 95
#The number you entered is odd.