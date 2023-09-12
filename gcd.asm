#
# Zac Stray
# Exercise 4
# 
	.text
        addi   	$v0, $zero, 5	#5 is syscall for userinput and that is stored in $v0
	syscall
	add 	$s0, $zero, $v0	#the number in $v0 get put into $s0
	addi   	$v0, $zero, 5	#5 is syscall for userinput and that is stored in $v0
	syscall
	add 	$s1, $zero, $v0	#the number in $v0 get put into $s1
	beqz	$s0, aLess
	beqz	$s1, bLess
	rem	$a1, $s0, $s1	#finds remander of $s0 $s1
loop:	beqz	$a1, out
	rem	$a1, $s0, $s1	#finds remander of $s0 $s1
	div	$a0, $s0, $s1	#divides $s0 $s1
	add	$s0, $zero, $s1	#sets $s1 to $s0
	add	$s1, $zero, $a1	#sets $a1 to $s0
	j	loop
	
aLess:
	add	$a0, $zero, $s1

bLess:	
	add	$a0, $zero, $s0

out:
	add	$a0, $zero, $s0
	addi   	$v0, $zero, 1	# service 1 is "print integer"
       	syscall                	# print the result (from $a0)
	addi   	$v0, $zero, 10 	# service 10 is "exit"
       	syscall                	# We're outta here!
	