# programa que vai receber um input inteiro e vai imprimir de 0 at� o n�mero do input

.data
	msg: .asciiz "Digite um inteiro: "
	msg_final: .asciiz "Final do programa!"
	
	espaco: .byte ' '
	
.text
	# imprimir msg
	li $v0, 4
	la $a0, msg
	syscall
	
	# ler inteiro
	li $v0, 5
	syscall
	
	# guardando o inteiro que estava em $v0 em $s0
	move $s0, $v0
	
	# guardando $zero em um registrador auxiliar ($t0) para a l�gica
	move $t0, $zero
	
	# come�ar o label while (la�o)
	beqz $zero, while
	
while:
	# se o valor de $t0 (o que est� sendo adicionado) for igual � $s0 (n�mero limite), vai para o exit
	bgt $t0, $s0, exit
	
	# caso contr�rio, vai para o print_numb
	beqz $zero, print_numb
	
print_numb:
	# imprimindo o inteiro que est� em $t0 (n�mero que est� sendo adicionado em 1)
	li $v0, 1
	move $a0, $t0
	syscall

	# imprimindo o espa�o em branco
	li $v0, 4
	la $a0, espaco
	syscall
	
	# adicionando em 1 o valor que est� em $t0
	addi $t0, $t0, 1
	
	# voltando para o la�o de repeti��o
	j while

exit: 	
	# imprimindo msg_final
	li $v0, 4
	la $a0, msg_final
	syscall

	# exit
	li $v0, 10
	syscall