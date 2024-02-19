########## lab1 ################
# Author: Madison
# Description: This program prompts the user to enter their name and then greets them with a welcome message.
# Initial Algorithm:
#   1. Prompt the user to enter their name.
#   2. Read the user's name.
#   3. Print "Hello" followed by the user's name.
#   4. Print a welcoming message.
#   5. End the program.
# Input Variables: User's name (string)
# Output Variables: Greeting (string)
# Addition Variables: None
# Formulas: None
# Refined Algorithm:
#   1. Prompt the user to enter their name.
#   2. Read the user's name and store it in a memory location.
#   3. Load the address of the user's name into a register.
#   4. Load the syscall code for printing a string into $v0.
#   5. Perform a syscall to print the string stored at the address in the register.
#   6. Load the address of the welcoming message into a register.
#   7. Load the syscall code for printing a string into $v0.
#   8. Perform a syscall to print the welcoming message.
#   9. End the program.
####################################

.text
        .globl main
main:

la $a0,prompt 				#loads address of the name prompt into a0
li $v0,4				#indicates to display a string in v0
syscall					#print the prompt string

li $a1, 81       			#string length 81 characters
la $a0, string   			#loads address of the string
li $v0, 8       			#call number for reading string from user input
syscall          			#executes system call to read string from user input

la $a0, output                  	#load address of output message into $a0
li $v0,4                        	#load the call code number to display the string into $v0
syscall                         	#system call to print "Hello" message

la $a0, string          		#load the address of the user's name into $a0
li $v0, 4            			#load the print string syscall code into $v0
syscall              			#print the user's name

li $v0, 10                      	#Exit
syscall

#####data section######

.data

prompt: .asciiz "What is your name? " 	#prompt for user input
string: .space 82			#initialize number of characters in string
output: .asciiz "Hello, "		#output "Hello" message

######## Output #####################
#What is your name? Madi	    #
#Hello, Madi		            #
#
#####################################