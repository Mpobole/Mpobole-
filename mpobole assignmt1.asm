.data
	var_is_not_prime: .asciiz "is not prime"
	var_is_prime: .asciiz "is prime "
	reversed: .asciiz "reversed  "
.text
    main:
		li $t2, 13
		move $s3, $t2
		
		li $t1, 1
		move $s2, $t1
		
		b Isprime
		#bne $s2, $s1, Exit
		#	b Reverse
	
	Isprime:
		#intalize the number to be tested
		move $t1, $s3 ##
		move $s3, $t1
		
		li $t2, 2 
		
		#excluding number less than or equal to 1
		blt $t1, 1, isNotprime
		beq $t1, 1, isNotprime
		
		loopPrime:
			#branch when done prossecing numbers in range 
			beq $t2, $t1, isPrime
			#Successfuly divide input by number in range
			div $t1, $t2
			mfhi $t3
			beq $t3, $zero, isNotprime
			addi $t2, $t2, 1
			
			b loopPrime
			 
			 
			isPrime:
				move $s1, $t1
				
				#li $t4, 1
				#move $s1, $t4
				
				b Reverse
				#li $v0, 1
				#move $a0 , $s1
				#syscall
				#jr $ra  
				   
			# if it is not prime, jump to countloop and increment count (genarate!!!)	  
			isNotprime:
				#li $t4, 0
				#move $s1, $t4
				
				#li $v0, 1
				#move $a0 , $s1
				#syscall
				   
				b Exit
					

	Reverse:
		li $t3, 0 #revnumber = 0
		li $t5, 10 # t5 = 10
				
		#initialize the number to be reversed
		move $t4, $s1
		
		
	reverseloop:
		beq $t4,$zero,  Exit
		li $t2, 0 # t2  = remainder
		
		div $t4, $t5
		mfhi $t2            
		div $t4, $t4, $t5
		mul $t3, $t3, 10
		add $t3, $t3, $t2
		
		#move $s4, $t3
		
		b  reverseloop  
		
		li $v0, 4
		la $a1, reversed
		syscall
		 
		li $v0, 1  
		move $a1 ,$t3
		syscall
		
		
	Exit:
		  
		li $v0, 10
		syscall
	