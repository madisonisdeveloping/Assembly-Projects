########## Age & Birth Year Display Program ################
# Author: Madison
# Description: This program prompts the user for their age and birth year, then displays their age and year based on the input.
# Initial Algorithm:
#   1. Prompt user for their age.
#   2. Read and store the age.
#   3. Prompt user for their birth year.
#   4. Read and store the birth year.
#   5. Print "You were born in" message.
#   6. Print birth year.
#   7. Print "and you are" message.
#   8. Print age.
#   9. Print "years old." message.
# Data Requirements
# Input Variables: $v0 (age input), $v0 (year input)
# Output Variables: $a0 (output message), $a0 (age)
# Addition Variables: $t0 (temporary storage for age), $t1 (temporary storage for birth year)
# Formulas: None
# Refined Algorithm:
#   1. Prompt the user for their age by loading the address of the age prompt into $a0.
#   2. Use syscall code 4 to print the age prompt.
#   3. Use syscall code 5 to read the integer input from the user and store it in $v0.
#   4. Move the user's age from $v0 to $t0 for temporary storage.
#   5. Prompt the user for their birth year by loading the address of the year prompt into $a0.
#   6. Use syscall code 4 to print the year prompt.
#   7. Use syscall code 5 to read the integer input (birth year) from the user and store it in $v0.
#   8. Move the user's birth year from $v0 to $t1 for temporary storage.
#   9. Load the address of the output message "You were born in" into $a0.
#  10. Use syscall code 4 to print the output message.
#  11. Print the user's birth year stored in $t1 using syscall code 1.
#  12. Load the address of the "and you are" message into $a0.
#  13. Use syscall code 4 to print the "and you are" message.
#  14. Print the user's age stored in $t0 using syscall code 1.
#  15. Load the address of the "years old.\n" message into $a0.
#  16. Use syscall code 4 to print the "years old.\n" message.
#  17. Exit the program using syscall code 10.
####################################

.text
        .globl main
main:

la $a0, prompt 				#loads address of age prompt into a0
li $v0, 4				#indicates to display a string in v0
syscall					#print the age prompt

li $v0, 5                        	#load user prompted integer into v0
syscall                         	#system call to read the integer and store in v0
move $t0, $v0				#move the age from v0 to t0

la $a0, prompt2				#loads address of year prompt into a0
li $v0, 4				#indicates to display a string in v1
syscall					#prints the year prompt

li $v0, 5				#read integer code into v0
syscall					#read and store integer in v0
move $t1, $v0				#move birth year integer from v0 to t1

la $a0, output				#loads address of output into a0
li $v0, 4				#code for print string
syscall					#print to console

move $a0, $t1              		#move birth year into a0
li $v0, 1                  		#code for print integer
syscall                    		#print birth year

la $a0, endl				#"and you are" output
li $v0, 4				#with user age.
syscall					#printed to console.

move $a0, $t0              		#move age into a0
li $v0, 1                  		#code for print integer
syscall                    		#print age

la $a0, output2            		#load address of "years old.\n" into $a0
li $v0, 4                  		#code for print string
syscall                    		#print output

li $v0,10                       	#exit
syscall

#####data section######

.data

prompt: .asciiz "How old are you? " 	#prompt for age input
prompt2: .asciiz "What year were you born in? " #prompt for year input
output: .asciiz "You were born in "	#output message (part 1)
endl: .asciiz " and you are "		#output message (part 2)
output2: .asciiz " years old.\n"	#output message (part 3)		

######## Output ########
#How old are you? 23
#What year were you born in? 2001
#You were born in 2001 and you are 23 years old.
