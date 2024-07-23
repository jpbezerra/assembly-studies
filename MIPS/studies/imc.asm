# código que calcula o IMC

.data
	msg_nome: .asciiz "Qual é o seu nome? "
	msg_peso: .asciiz "Qual é o seu peso? "
	msg_altura: .asciiz "Qual é a sua altura? "
	msg_imc: .asciiz ", o seu IMC é: "
	
	nome: .space 25
	aux: .float 0.0
	
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
	
	# lendo peso (float)
	li $v0, 6
	syscall
	
	# atribuindo o peso lido à $f1
	lwc1 $f1, aux
	add.s $f1, $f1, $f0
	
	# imprimindo msg_altura
	li $v0, 4
	la $a0, msg_altura
	syscall
	
	# lendo altura (float)
	li $v0, 6
	syscall
	
	# atribuindo a altura lida à $f2
	lwc1 $f2, aux
	add.s $f2, $f2, $f0
	
	# imprimindo o nome guardado anteriormente
	li $v0, 4
	move $a0, $t0
	syscall
	
	# imprimindo msg_imc
	li $v0, 4
	la $a0, msg_imc
	syscall
	
	# atribuindo o quadrado da altura à $f3
	mul.s $f3, $f2, $f2
	
	# calculando o IMC
	div.s $f12, $f1, $f3
	
	# imprimindo o IMC
	li $v0, 2
	syscall
	
	# exit
	li $v0, 10
	syscall