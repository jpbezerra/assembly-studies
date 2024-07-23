.data
	msg: .asciiz "Forneça um double: "
	aux: .double 0.0
	
.text
	# imprimindo msg
	li $v0, 4
	la $a0, msg
	syscall
	
	# lendo um double
	li $v0, 7
	syscall # o double vai para $f0 e $f1
	
	# atribuindo aux à um registrador qualquer contanto que seja par e não seja $f0 nem $f12
	ldc1 $f2, aux
	add.d $f12, $f2, $f0
	
	# imprimindo double
	li $v0, 3
	syscall

	# exit
	li $v0, 10
	syscall