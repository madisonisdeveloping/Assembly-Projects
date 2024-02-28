########## TotalCostTaxCalculator ################
# Author: Madison
# Description: This program calculates the sales tax and total cost of an item based on the user input for the item cost. It then displays the calculated sales tax, and total cost.
# Initial Algorithm:
# 1. Display prompt to enter the cost of the item
# 2. Read the input (item cost) from the user
# 3. Calculate the sales tax: 
# 4. Add the sales tax to the item cost to get the total cost: 
# 5. Display the sales tax message
# 6. Print the sales tax
# 7. Display the message indicating the total cost of the item
# 8. Print the total cost
# 9. Exit the program
# Data Requirements
# Input Variables: Float representing the cost of an item
# Output Variables: Float representing the sales tax, float representing the total cost of the item
# Addition Variables: Floats for sales tax rate (0.08) and item cost
# Formulas: sales_tax = item_cost * 0.08
#            total_cost = item_cost + sales_tax
# Refined Algorithm:
# 1. Display prompt to enter the cost of the item
# 2. Read the input (item cost) from the user
# 3. Calculate the sales tax: 
#    3.1 Load the sales tax rate (0.08) into $f6
#    3.2 Multiply the item cost by the sales tax rate and store the result in $f2
# 4. Add the sales tax to the item cost to get the total cost: 
#    4.1 Add the item cost and the sales tax (stored in $f2) and store the result in $f10
# 5. Display the sales tax message
# 6. Print the sales tax (stored in $f2)
# 7. Display the message indicating the total cost of the item
# 8. Print the total cost (stored in $f10)
# 9. Exit the program
####################################

        .text
        .globl main
main:

la $a0, prompt          # Load address of int prompt into $a0
li $v0, 4               # Indicate to display a string in $v0
syscall                 # Print the prompt

li $v0, 6               # Load system call code to read a float from keyboard
syscall                 # System call to read float and store in $f0

li.s $f6, 0.08          # Initialize floats for sales tax conversion
li.s $f8, 100.00

mul.s $f2, $f6, $f0     # Calculate sales tax and store in $f2
add.s $f10, $f0, $f2    # Add sales tax value to item cost value and store in $f10

la $a0, output          # Load address of output into $a0
li $v0, 4               # Indicate to display a string in $v0
syscall                 # Print the sales tax message

mov.s $f12, $f2         # Move total from $f2 to $f12 for display
li $v0, 2               # Load system call code to print a float
syscall                 # Print the sales tax

la $a0, endl            # Load address of endl into $a0
li $v0, 4               # Indicate to display a string in $v0
syscall                 # Print the item total cost message

mov.s $f12, $f10        # Move total from $f10 to $f12 for display
li $v0, 2               # Load system call code to print a float
syscall                 # Print the total cost

li $v0, 10              # Exit
syscall

#####data section######

.data

prompt: .asciiz "Enter cost of item: " 	#prompt for float
output: .asciiz "The sales tax is: "	#output message (part 1)
endl: .asciiz "\nYour item total cost is: "	#output message (part 2)	

######## Output ########
#Enter cost of item: 54.36
#The sales tax is: 4.34880018
#Your item total cost is: 58.70880127
