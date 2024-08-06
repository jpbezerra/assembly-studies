.data
	list: 
		.align 2 
		.word 40 # lista que carrega no m�ximo 100 n�meros
	
	# c�digo que faz o fatorial de um n�mero (considerando apenas os n�meros �mpares)

.text
	main:
		# l� um inteiro (no m�ximo 200 por causa do tamanho da lista)
		li $v0, 5
		syscall
		
		# movendo o valor de $v0 para $t0
		move $t0, $v0
		
		# $t1 = 1, vari�vel auxiliar para multiplicar
		li $t1, 1
		
		# vari�vel de �ndice, soma de 4 em 4
		li $t2, 0
		
		# vari�vel que guarda 2, para fazer a divis�o
		li $t3, 2
		
		# vari�vel qie guarda o tamanho da lista
		li $t4, 0
		
		# chamando a fun��o de opera��es
		jal operations
		
		# come�ando loop para ter o fatorial
		j loop
		
	operations:
		# se o n�mero ainda n�o � zero
		bne $t0, $zero, check_even
		
		# resetando a vari�vel de �ndices para percorrer a lista do in�cio		
		li $t2, 0
		
		# caso contr�rio, volta
		jr $ra
		
		check_even:
			# dividimos o n�mero atual por 2
			div $t0, $t3
			
			# movemos o resto da divis�o para $t4
			mfhi $t5
			
			# se o n�mero for �mpar
			bne $t5, $zero, decrease
			
			# se for igual, vai para a recurs�o direto
			beq $t5, $zero, recursion
			
			decrease:
				# guardando o n�mero em list
				sw $t0, list($t2)
				
				# atualizando o �ndice
				addi $t2, $t2, 4
				
				# aumentando a vari�vel de tamanho da lista
				addi $t4, $t4, 1
				
			recursion:
				# diminuindo o n�mero
				subi $t0, $t0, 1
				
				# recurs�o
				jal operations
	
	loop:
		# se acabou, os n�meros, o c�digo acaba
		beq $t4, 0, exit
	
		# pegando o n�mero no �ndice em $t2
		lw $s0, list($t2) 
		
		# aumentando o �ndice em 4
		addi $t2, $t2, 4
		
		# guardando o resultado em $t1
		mul $t1, $t1, $s0
		
		# diminuindo o tamanho da lista
		subi $t4, $t4, 1
		
		j loop
		
		exit:
			li $v0, 1
			move $a0, $t1
			syscall
			
			li $v0, 10
			syscall