.data
	msg_inicial: .asciiz "Forneça sua idade: "
	msg_final: .asciiz "Sua idade é: "

.text
	li $v0, 4 # imprimir string
	la $a0, msg_inicial # movendo a string para $a0
	syscall
	
	li $v0, 5 # ler inteiro
	syscall # armazenar o inteiro lido em $v0
	
	move $t0, $v0 # mover o inteiro lido em $v0 para $t0
	
	li $v0, 4 # imprimir string
	la $a0, msg_final # movendo a string para $a0
	syscall
	
	li $v0, 1 # imprimir inteiro
	move $a0, $t0 # movendo o valor em $t0 para $a0
	syscall
	
	li $v0, 10
	syscall