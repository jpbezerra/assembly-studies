.data
	msg: .asciiz "Ol�, hoje � dia: \n22/07/2024"
.text
.main:
	# mover msg para $a0
	la $a0, msg
	
	# chamando a fun��o imprimir_nome
	jal imprimir_nome
	
	# ap�s isso, vou para a label exit
	jal exit

# fun��o de imprimir o nome, como apenas $a0 foi utilizado; $a1, $a2 e $a3 s�o zero por padr�o
imprimir_nome:
	# imprimir string
	li $v0, 4
	syscall
	
	# retorno da fun��o
	jr $ra
	
exit:
	# exit
	li $v0, 10
	syscall