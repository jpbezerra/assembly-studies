.data
	list: 
		.align 2 
		.word 40 # lista que carrega no máximo 100 números
	
	# código que faz o fatorial de um número (considerando apenas os números ímpares)

.text
	main:
		# lê um inteiro (no máximo 200 por causa do tamanho da lista)
		li $v0, 5
		syscall
		
		# movendo o valor de $v0 para $t0
		move $t0, $v0
		
		# $t1 = 1, variável auxiliar para multiplicar
		li $t1, 1
		
		# variável de índice, soma de 4 em 4
		li $t2, 0
		
		# variável que guarda 2, para fazer a divisão
		li $t3, 2
		
		# variável qie guarda o tamanho da lista
		li $t4, 0
		
		# chamando a função de operações
		jal operations
		
		# começando loop para ter o fatorial
		j loop
		
	operations:
		# se o número ainda não é zero
		bne $t0, $zero, check_even
		
		# resetando a variável de índices para percorrer a lista do início		
		li $t2, 0
		
		# caso contrário, volta
		jr $ra
		
		check_even:
			# dividimos o número atual por 2
			div $t0, $t3
			
			# movemos o resto da divisão para $t4
			mfhi $t5
			
			# se o número for ímpar
			bne $t5, $zero, decrease
			
			# se for igual, vai para a recursão direto
			beq $t5, $zero, recursion
			
			decrease:
				# guardando o número em list
				sw $t0, list($t2)
				
				# atualizando o índice
				addi $t2, $t2, 4
				
				# aumentando a variável de tamanho da lista
				addi $t4, $t4, 1
				
			recursion:
				# diminuindo o número
				subi $t0, $t0, 1
				
				# recursão
				jal operations
	
	loop:
		# se acabou, os números, o código acaba
		beq $t4, 0, exit
	
		# pegando o número no índice em $t2
		lw $s0, list($t2) 
		
		# aumentando o índice em 4
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