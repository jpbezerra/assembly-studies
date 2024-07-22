.data
	msg: .asciiz "Digite um número: "
	msg_maior: "Este número é maior que 0."
	msg_menor: "Este número é menor que 0."
	msg_igual: .asciiz "Este número é o próprio 0."
	
.text
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	bgt $t0, $zero, label_maior
	blt $t0, $zero, label_menor
	beq $t0, $zero, label_igual
	
label_maior:
	li $v0, 4
	la $a0, msg_maior
	syscall
	
	beqz $zero, forever

label_menor:
	li $v0, 4
	la $a0, msg_menor
	syscall
	
	beqz $zero, forever

label_igual:
	li $v0, 4
	la $a0, msg_igual
	syscall
	
	beqz $zero, forever

forever:
	li $v0, 10
	syscall