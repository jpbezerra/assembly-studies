.data
	msg_add: .asciiz "Adi��o: "
	msg_sub: .asciiz ", Subtra��o: "
	msg_mul: .asciiz ", Multiplica��o: "
	msg_div: .asciiz ", Divis�o: "
	msg_lo: .asciiz " Parte inteira: "
	msg_hi: .asciiz " Resto da divis�o: "
	msg_sll: .asciiz ", Potencia��o: "
	msg_srl: .asciiz ", Divis�o em pot�ncias de dois: "

.text
	li $t0, 75 # colocando o valor de 75 em $t0
	li $t1, 25 # colocando o valor de 25 em $t1
	# mesma coisa que addi $t1, $zero, 25
	
	add $s0, $t0, $t1 # guardando a soma do que est� em $t0 + o que est� em $t1 no registrador $s0
	addi $s1, $s0, 36 # guardando a soma do que est� em $s0 + 36
	
	li $v0, 4 # imprimindo uma string
	la $a0, msg_add # guardando em $a0 o endere�o de msg_add
	syscall
	
	li $v0, 1 # imprimindo um inteiro
	move $a0, $s1 # movendo o que est� em $s1 para $a0
	syscall
	
	sub $s2, $t0, $t1 # guardando em $s2 o valor de $t0 - $t1
	subi $s3, $s2, 60 # guardando em $s3 o valor de $s2 - 60
	
	li $v0, 4 # imprimindo uma string
	la $a0, msg_sub # guardando em $a0 o endere�o de msg_sub
	syscall
	
	li $v0, 1 # imprimindo um inteiro
	move $a0, $s3 # movendo o que est� em $s3 para $a0
	syscall
	
	mul $s0, $s1, $s3
	
	li $v0, 4 # imprimindo uma string
	la $a0, msg_mul # guardando em $a0 o endere�o de msg_mul
	syscall
	
	li $v0, 1 # imprimindo um inteiro
	move $a0, $s0 # movendo o que est� em $s0 para $a0
	syscall
	
	li $v0, 4 # imprimindo uma string
	la $a0, msg_div # guardando em $a0 o endere�o de msg_div
	syscall
	
	li $v0, 4 # imprimindo uma string
	la $a0, msg_lo # guardando em $a0 o endere�o de msg_lo
	syscall
	
	div $t0, $s2 # dividindo $t0 (75) por $s2 (50)
	
	li $v0, 1 # imprimindo um inteiro
	mflo $a0 # movendo o que est� em $lo para $a0
	syscall
	 
	li $v0, 4 # imprimindo uma string
	la $a0, msg_hi # guardando em $a0 o endere�o de msg_hi
	syscall
	
	li $v0, 1 # imprimindo um inteiro
	mfhi $a0 # movendo o que est� em $hi para $a0
	syscall
	
	li $v0, 4 # imprimindo uma string
	la $a0, msg_sll # guardando em $a0 o endere�o de msg_sll
	syscall
	
	mul $s0, $s3, -1 # guardando em $s0 o valor de -1($s3)
	sll $s4, $s0, 10 # fazendo o shift-left de 10 casas ($s0 x 2^10) de $s0 e guardando em $s4
	
	li $v0, 1 # imprimindo um inteiro
	move $a0, $s4 # movendo o que est� em $s4 para $a0
	syscall
	
	li $v0, 4 # imprimindo uma string
	la $a0, msg_srl # guardando em $a0 o endere�o de msg_sll
	syscall 
	
	srl $s0, $s4, 5 # fazendo o shif-right de 5 casas ($s4 / (2^5)) de $s4 e guardando em $s0
	
	li $v0, 1 # imprimindo um inteiro
	move $a0, $s0 # movendo o que est� em $s0 para $a0
	syscall
	
	li $v0, 10 # terminando o programa
	syscall