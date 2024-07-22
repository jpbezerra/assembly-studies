.data
	msg_inicial: .asciiz "Qual é o seu nome? "
	msg_final: .asciiz "Olá, "
	nome: .space 25

.text
	li $v0, 4
	la $a0, msg_inicial
	syscall
	
	li $v0, 8
	la $a0, nome
	la $a1, 25
	syscall
	
	move $t0, $a0
	
	li $v0, 4
	la $a0, msg_final
	syscall
	
	li $v0, 4
	move $a0, $t0
	syscall