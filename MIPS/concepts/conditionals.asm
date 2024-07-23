.data
	msg: .asciiz "Digite um número: "
	msg_impar: .asciiz "O número é ímpar"
	msg_par: .asciiz "O número é par"

.text
	# imprimindo msg
	li $v0, 4
	la $a0, msg
	syscall
	
	# lendo um inteiro
	li $v0, 5
	syscall
	
	# movendo o inteiro lido para $s0
	move $s0, $v0
	
	# atribuindo o valor 2 para $t0
	li $t0, 2
	
	# divindindo $s0 por $t0 (2)
	div $s0, $t0
	
	# movendo o resto da divisão para $t1
	mfhi $t1
	
	# se $t1 é igual à $zero, vai para a label print_par
	beq $t1, $zero, print_par
	
	# senão, vai continuar aqui e imprimir msg_impar
	li $v0, 4
	la $a0, msg_impar
	syscall
	
	# exit
	li $v0, 10
	syscall

# label do condicional
print_par:
	# imprimindo msg_par
	li $v0, 4
	la $a0, msg_par
	syscall
	
	# exit
	li $v0, 10
	syscall