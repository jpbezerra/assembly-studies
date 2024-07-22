.data
	msg: .asciiz "Digite um n�mero inteiro: "
	msg_par: .asciiz "Este n�mero � par!"
	msg_impar: .asciiz "Este n�mero � �mpar!"
	
.text
.main:
	# imprimir msg
	li $v0, 4
	la $a0, msg
	syscall
	
	# fun��o input_numero
	jal input_numero
	
	# verificando se o n�mero � par ou �mpar
	jal verify

# nesta fun��o eu pe�o o input de um inteiro e fa�o opera��es	
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
	
	# retornando a fun��o
	jr $ra

	# n�o � preciso retornar pois n�o temos mais nada na main

# fun��o de verificar se � par ou �mpar
verify:
	# se $a0 � par
	beq $a0, $zero, imprimir_par
	
	# se � �mpar (n�o precisa dessa opera��o, poder�amos apenas ter colocado o c�digo da label logo abaixo)
	bne $a0, $zero, imprimir_impar
	
	# n�o � preciso retornar pois n�o iremos fazer mais nada no c�digo

	imprimir_par: 
		# imprimindo msg_par
		li $v0, 4
		la $a0, msg_par
		syscall
	
		# chamando a fun��o exit
		jal exit
	
	imprimir_impar:
		# imprimindo msg_impar
		li $v0, 4
		la $a0, msg_impar
		syscall
	
		# chamando a fun��o exit
		jal exit
		
exit:
	# exit
	li $v0, 10
	syscall
