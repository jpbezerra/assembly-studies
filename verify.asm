.data
	msg: .asciiz "Digite um número inteiro: "
	msg_par: .asciiz "Este número é par!"
	msg_impar: .asciiz "Este número é ímpar!"
	
.text
.main:
	# imprimir msg
	li $v0, 4
	la $a0, msg
	syscall
	
	# função input_numero
	jal input_numero
	
	# verificando se o número é par ou ímpar
	jal verify

# nesta função eu peço o input de um inteiro e faço operações	
input_numero:
	# ler inteiro
	li $v0, 5
	syscall
	
	# guardar o inteiro em $a0
	move $a0, $v0
	
	# guardar o valor de 2 em $t0
	li $t0, 2
	
	# dividir $a0 por $t0
	div $a0, $t0
	
	# guardando o valor de $hi em $a0
	mfhi $a0
	
	# retornando a função
	jr $ra

	# não é preciso retornar pois não temos mais nada na main

# função de verificar se é par ou ímpar
verify:
	# se $a0 é par
	beq $a0, $zero, imprimir_par
	
	# se é ímpar (não precisa dessa operação, poderíamos apenas ter colocado o código da label logo abaixo)
	bne $a0, $zero, imprimir_impar
	
	# não é preciso retornar pois não iremos fazer mais nada no código

	imprimir_par: 
		# imprimindo msg_par
		li $v0, 4
		la $a0, msg_par
		syscall
	
		# chamando a função exit
		jal exit
	
	imprimir_impar:
		# imprimindo msg_impar
		li $v0, 4
		la $a0, msg_impar
		syscall
	
		# chamando a função exit
		jal exit
		
exit:
	# exit
	li $v0, 10
	syscall
