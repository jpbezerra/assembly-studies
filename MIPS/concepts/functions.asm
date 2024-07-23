.data
	msg: .asciiz "Olá, hoje é dia: \n22/07/2024"
.text
.main:
	# mover msg para $a0
	la $a0, msg
	
	# chamando a função imprimir_nome
	jal imprimir_nome
	
	# após isso, vou para a label exit
	jal exit

# função de imprimir o nome, como apenas $a0 foi utilizado; $a1, $a2 e $a3 são zero por padrão
imprimir_nome:
	# imprimir string
	li $v0, 4
	syscall
	
	# retorno da função
	jr $ra
	
exit:
	# exit
	li $v0, 10
	syscall