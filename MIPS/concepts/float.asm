.data
	msg_inicial: .asciiz "Forneça um valor do tipo float: "
	msg_final: .asciiz "Seu número é: "
	aux: .float 0.0
	
.text
	# imprimir msg
	li $v0, 4
	la $a0, msg_inicial
	syscall
	
	# ler um float
	li $v0, 6
	syscall # ao ler o float, o valor estará em $f0
	
	# imprimindo msg_final
	li $v0, 4
	la $a0, msg_final
	syscall
	
	# atribuindo aux à um registrador qualquer contanto que não seja $f0 ou $f12
	lwc1 $f1, aux
	add.s $f12, $f1, $f0
	
	# imprimir o float
	li $v0, 2
	syscall 
	
	# exit
	li $v0, 10
	syscall