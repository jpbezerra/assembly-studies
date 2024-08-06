.data
	pathToFile: .asciiz "C:/Users/jplim/Documents/Programa��o/doc.txt" # qualquer diretório
	content: .space 1024
	msg: .asciiz "Escrevi neste arquivo"
	msg2: .ascii "Escrevi de novo"
	
.text
	# modo de escrita de arquivo
	li $v0, 13
	la $a0, pathToFile
	li $a1, 1
	syscall
	
	# guardando uma c�pia do descritor
	move $s0, $v0
	move $a0, $s0
	
	# colocando a palabra no arquivo
	li $v0, 15
	la $a1, msg
	li $a2, 22
	syscall
	
	# fechando o arquivo
	li $v0, 16
	syscall
	
	# modo de leitura do arquivo
	li $v0, 13
	la $a0, pathToFile
	li $a1, 0
	syscall
	
	# guardando c�pias do descritor
	move $s0, $v0
	move $a0, $s0 
	# descritor precisa estar em $a0 quando dar syscall em opera��es de arquivo
	
	# guardando o conte�do do arquivo em $a1
	li $v0, 14
	la $a1, content
	li $a2, 1024
	syscall
	
	# printando o conte�do do arquivo
	li $v0, 4
	move $a0, $a1 # colocando o content em $a0
	syscall
	
	# fechando o arquivo
	li $v0, 16
	move $a0, $s0 
	# colocando o descritor em $a0 mais uma vez
	syscall
	
	# exit
	li $v0, 10
	syscall
	
