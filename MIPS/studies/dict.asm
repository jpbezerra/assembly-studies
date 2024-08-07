.data	
	hashValues: .space 40 # 10 números
	Perm: .word 4, 7, 1, 2, 8, 5, 3, 9
	hifen: .byte ' '
	newLine: .asciiz "\n"
	key: .asciiz "Key: "
	value: .asciiz "Value: "
	
.text
	main:
		# comentários:
		# $s0: quantidade de inteiros a serem colocados
		# $s1: cópia da quantidade de inteiros
		# $t6: guarda o valor de 10
	
		# lendo um inteiro
		li $v0, 5
		syscall
		
		# guardando o número de inteiros em $s0 (quantos números vamos colocar no dicionário)
		move $s0, $v0
		
		# fazendo uma cópia do número de inteiros
		move $s1, $s0
		
		# guardando 10 em $t0
		li $t6, 10
		
		# se o número superar o número de índices, vai para a label decrease
		bgt $s0, $t6, decrease
		
		# caso contrário, vai direto para o loop
		ble $s0, $t6, loop
		
		decrease:
			# diminuindo o número para 10
			li $s0, 10
			
			# indo para o loop - talvez não precise
			j loop
	
	loop:
		# comentários:
		# $t0: número que vai ser colocado
	
		# se acabarem os números, printamos eles
		beq $s0, $zero, printDict
		
		# lendo um número para colocar no dicionário
		li $v0, 5
		syscall
		
		# guardando o número em $t0
		move $t0, $v0
		
		# calclando a hashKey
		jal h
		
		# diminuindo o valor do número de inteiros restantes a serem colocados no dicionário ($s0)
		subi $s0, $s0, 1
		
		j loop
	
	# função de hashKey, h(k) = (k ^ 2) mod 10
	h:
		# comentários:
		# $t1: chave base
		# $t2: valor do índice temporário
		# $t3: guarda o valor de 4 para multiplicar
		# $t4: guarda o valor de hashValues[$t2]
		# $t5: guarda o valor de 0, serve como os índices do Perm
		
		# guardando o resultado do quadrado de $t0 em $t1
		mul $t1, $t0, $t0
		
		# fazendo a divisão entre $t1 e $t6 (10)
		div $t1, $t6
		
		# guardando a hashKey em $t1
		mfhi $t1
		
		# guardando o valor de 4 para multiplicar, já que a array vai de 4 em 4
		li $t3, 4
		
		# valor do índice = $t1
		mul $t2, $t1, $t3
		
		# pegando o valor que está no índice $t1
		lw $t4, hashValues($t2)
		
		# se esse valor for igual à 0, vamos guardá-lo na array
		beq $t4, $zero, store
		
		# variável auxiliar para pegar os índices do Perm
		li $t5, 0
	
		probing:
			# comentários:
			# $t7: pega o valor de Perm[$t5]
		
			# guardando em $t6 o número do índice $t5 em Perm
			lw $t7, Perm($t5)
			
			# guardando a soma com o Perm em $t1
			li $t2, 0
			add $t2, $t1, $t7
			
			# fazendo a divisão por 10
			div $t2, $t6
			
			# guardando a hashKey em $t1
			mfhi $t2
			
			mul $t2, $t2, $t3
			
			# pegando o valor que está no índice $t1
			lw $t4, hashValues($t2)
		
			# se esse valor for igual à 0, vamos guardá-lo na array
			beq $t4, $zero, store
			
			# caso contrário fazemos um outro probing
			addi $t5, $t5, 4
			
			j probing
		
		store:
			# se for 0, colocamos na array
			sw $t0, hashValues($t2)
			
			# return
			jr $ra
	
	printDict:
		# variável para printar os valores em hashValues (de 4 em 4)
		li $t1, 0
		
		# variável para printar as chaves (de 1 em 1)
		li $t2, 0
		
		# guardando o valor de 4 em $t4
		li $t3, 40
		
		subLoop:
			# se já acabaram os números, acaba
			beq $t1, $t3, exit
			
			# printando uma nova linha a cada iteração
			li $v0, 4
			la $a0, newLine
			syscall
			
			# printando a string "Key: "
			li $v0, 4
			la $a0, key
			syscall
		
			# printando a chave
			li $v0, 1
			add $a0, $t2, $zero
			syscall
			
			# printando o espaço entre a chave e o número
			li $v0, 4
			la $a0, hifen
			syscall
			
			# printando a string "Value: "
			li $v0, 4
			la $a0, value
			syscall
			
			# pegando o valor da key e printando
			lw $a0, hashValues($t1)
			li $v0, 1
			syscall
			
			# atualizando as variáveis
			addi $t2, $t2, 1
			addi $t1, $t1, 4
			
			# printando o espaço entre a chave e o número
			li $v0, 4
			la $a0, hifen
			syscall
			
			j subLoop
		
		exit:
			li $v0, 10
			syscall