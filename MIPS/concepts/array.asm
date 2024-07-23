.data
	array:
		.align 2
		.space 16
	
	espaco: .byte ' '
.text
.main:
	# �ndice do array
	move $t0, $zero
	
	# valor a ser colocado no array
	move $t1, $zero 
	
	# limite de $t0
	li $t2, 16

	# label do loop	
loop:
	# se $t0 == 16, sai do loop
	beq $t0, $t2, exit_loop
	
	# caso contr�rio, colocar %t1 em array($t0)
	sw $t1, array($t0)
	
	# incrementando o �ndice
	addi $t0, $t0, 4
	
	# incrementando o n�mero
	addi $t1, $t1, 1
	
	# voltando ao loop
	j loop

# label de sair do loop
exit_loop: 
	# atribuindo o valor de 0 para $t0 a fim de imprimir o array
	move $t0, $zero
	
	# entrando na label imprime
	beqz $zero, imprime

# label de imprimir os elementos da array
imprime: 
	# se $t0 == 16, sai da impress�o
	beq $t0, $t2, exit
	
	# imprimindo inteiro
	li $v0, 1
	
	# atribuindo array($t0) � $a0
	lw $a0, array($t0)
	syscall
	
	# imprimindo um espa�o em branco
	li $v0, 4
	la $a0, espaco
	syscall
	
	# incrementando o �ndice
	addi $t0, $t0, 4
	
	# voltando ao loop de impress�o
	j imprime

exit:
	# exit
	li $v0, 10
	syscall
