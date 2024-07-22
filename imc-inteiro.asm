# c�digo que calcula p IMC (desde que os valores sejam inteiros)

.data
	msg_nome: .asciiz "Qual � o seu nome? "
	msg_peso: .asciiz "Qual � o seu peso? "
	msg_altura: .asciiz "Qual � a sua altura? "
	msg_imc: .asciiz ", o seu IMC �: "
	
	nome: .space 25
	
.text
	# imprimindo msg_nome
	li $v0, 4
	la $a0, msg_nome
	syscall
	
	# lendo nome (string)
	li $v0, 8
	la $a0, nome
	la $a1, 25
	syscall
	
	# guardando o nome em $t0
	move $t0, $a0
	
	# imprimindo msg_peso
	li $v0, 4
	la $a0, msg_peso
	syscall
	
	# lendo peso (inteiro)
	li $v0, 5
	syscall
	
	# movendo o peso para $s0
	move $s0, $v0
	
	# imprimindo msg_altura
	li $v0, 4
	la $a0, msg_altura
	syscall
	
	# lendo altura (inteiro)
	li $v0, 5
	syscall
	
	# movendo a altura para $s0
	move $s1, $v0
	
	# imprimindo o nome guardado anteriormente
	li $v0, 4
	move $a0, $t0
	syscall
	
	# imprimindo msg_imc
	li $v0, 4
	la $a0, msg_imc
	syscall
	
	# fazendo o quadrado da altura
	mul $s2, $s1, $s1
	
	# dividindo o peso ($s0) pela altura ao quadrado ($s1)
	div $s0, $s2
	
	# imprimindo o resultado do IMC
	li $v0, 1
	mflo $a0
	syscall
	
	# exit
	li $v0, 10
	syscall
