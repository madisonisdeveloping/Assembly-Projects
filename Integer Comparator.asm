########## Integer Comparator ################
# Author: Madison
# Description: This program takes two integers as input from the user and determines the smallest of the two.
# Initial Algorithm:
# 1. Prompt the user to enter the first integer.
# 2. Read the first integer input.
# 3. Prompt the user to enter the second integer.
# 4. Read the second integer input.
# 5. Compare the two integers to determine which is smaller.
# 6. Display the smallest integer to the user.
#
# Data Requirements
# Input Variables: Two integers entered by the user.
# Output Variables: The smallest integer.
# Addition Variables: Temporary registers for storing input and output values.
# Formulas: None.
#
# Refined Algorithm:
# 1. Display the prompt "Enter your first integer:" to the user.
# 2. Read the first integer input from the user and store it in register $v0.
# 3. Move the value from register $v0 to register $t0 to store the first integer.
# 4. Display the prompt "Enter your second integer:" to the user.
# 5. Read the second integer input from the user and store it in register $v0.
# 6. Move the value from register $v0 to register $t1 to store the second integer.
# 7. Display the message "The smallest integer is" to the user.
# 8. Compare the values of $t0 and $t1 to determine which is smaller.
# 9. If $t0 is greater than $t1, branch to ELSE.
# 10. Move the value of $t0 to $a0 to prepare for printing as the smallest integer.
# 11. Print the value in $a0 as the smallest integer.
# 12. Jump to the ENDIF label to skip the ELSE block.
# 13. ELSE: Move the value of $t1 to $a0 to prepare for printing as the smallest integer.
# 14. Print the value in $a0 as the smallest integer.
# 16. Exit the program.
####################################

        .text
        .globl main
main:

la $a0, prompt          #load address of int prompt into $a0
li $v0, 4               #indicate to display a string in $v0
syscall                 #print the prompt

li $v0, 5               #load user prompted integer into v0
syscall                 #system call to read the integer and store in v0
move $t0, $v0		#move the age from v0 to t0

la $a0, prompt2 	#loads address of int prompt into a0
li $v0, 4		#indicates to display a string in v0
syscall			#print the int prompt

li $v0, 5               #load user prompted integer into v0
syscall                 #system call to read the integer and store in v0
move $t1, $v0		#move the age from v0 to t1

la $a0, output           #load address of output message into a0
li $v0,4                 #load call code number to display a string into v0
syscall                  #system call to print output string

bgt $t0, $t1, ELSE      #IF t0 > t1 then Branch to ELSE
move $a0,$t0            #IF t0 < t1 move t0 -> a0 for display as largest
li $v0,1                #load call code number to display integer into v0
syscall                 #system call to print t0 as largest   
j ENDIF                 #done with IF so jump over ELSE code to ENDIF label
 
ELSE:  move $a0,$t1     #ELSE t1 is smaller so move t1 -> a0 for display
li $v0,1                #load call code number to display integer into v0
syscall                 #system call to print t1 as smallest

ENDIF:
la $a0,endl             #load the new line character into a0
li $v0,4                #load the call code number to display the string into v0
syscall                 #system call to print the new line character

li $v0,10               #exit
syscall

#####data section######

.data

prompt: .asciiz "Enter your first integer: " 	#prompt for int 1
prompt2: .asciiz "Enter your second integer: "	#prompt for int 2
output: .asciiz "The smallest integer is " #output message
endl: .asciiz "\n"    #new line

######## Output ########
#Enter your first integer: 90
#Enter your second integer: 2
#The smallest integer is 2
