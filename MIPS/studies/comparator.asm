.data
	msg: .asciiz "Digite um número: "
	msg_maior: "Este número é maior que 0."
	msg_menor: "Este número é menor que 0."
	msg_igual: .asciiz "Este número é o próprio 0."
	
.text
	# imprimir msg
	li $v0, 4
	la $a0, msg
	syscall
	
	# ler inteiro
	li $v0, 5
	syscall
	
	# guardando o inteiro em $t0
	move $t0, $v0
	
	# se $t0 > 0
	bgt $t0, $zero, label_maior
	
	# se $t0 < 0
	blt $t0, $zero, label_menor
	
	# se $t0 == 0
	beq $t0, $zero, label_igual
	
label_maior:
	# imprimir msg_maior
	li $v0, 4
	la $a0, msg_maior
	syscall
	
	# facilitador para ir para a label forever
	beqz $zero, forever

label_menor:
	# imprimir msg_menor
	li $v0, 4
	la $a0, msg_menor
	syscall
	
	# facilitador para ir para a label forever
	beqz $zero, forever

label_igual:
	# imprimir msg_igual
	li $v0, 4
	la $a0, msg_igual
	syscall
	
	# facilitador para ir para a label forever
	beqz $zero, forever

# label de exit, apenas para facilitar e escrever menos código
forever:
	# exit
	li $v0, 10
	syscall
