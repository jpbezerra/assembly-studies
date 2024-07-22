.data
	# área para dados na memória principal
	msg: .asciiz "Olá, mundo!" # mensagem de olá mundo


.text
	# área para instruções do programa
	
	li $v0, 4 # impressão de string
	la $a0, msg # indicar o endereço em que está a mensagem
	 
	syscall # faça o que está em $a0

	li $v0, 10
	syscall
