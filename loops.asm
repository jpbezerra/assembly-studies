# programa que vai receber um input inteiro e vai imprimir de 0 até o número do input

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
	
	# guardando $zero em um registrador auxiliar ($t0) para a lógica
	move $t0, $zero
	
	# começar o label while (laço)
	beqz $zero, while
	
while:
	# se o valor de $t0 (o que está sendo adicionado) for igual à $s0 (número limite), vai para o exit
	bgt $t0, $s0, exit
	
	# caso contrário, vai para o print_numb
	beqz $zero, print_numb
	
print_numb:
	# imprimindo o inteiro que está em $t0 (número que está sendo adicionado em 1)
	li $v0, 1
	move $a0, $t0
	syscall

	# imprimindo o espaço em branco
	li $v0, 4
	la $a0, espaco
	syscall
	
	# adicionando em 1 o valor que está em $t0
	addi $t0, $t0, 1
	
	# voltando para o laço de repetição
	j while

exit: 	
	# imprimindo msg_final
	li $v0, 4
	la $a0, msg_final
	syscall

	# exit
	li $v0, 10
	syscall