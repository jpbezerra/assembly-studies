.data
	# �rea para dados na mem�ria principal
	msg: .asciiz "Ol�, mundo!" # mensagem de ol� mundo


.text
	# �rea para instru��es do programa
	
	li $v0, 4 # impress�o de string
	la $a0, msg # indicar o endere�o em que est� a mensagem
	 
	syscall # fa�a o que est� em $a0
