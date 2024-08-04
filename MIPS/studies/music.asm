.data
	
	musics: 
		.space 32
		.align 2
	
	msc1: .word 1
	msc2: .word 2
	msc3: .word 3
	msc4: .word 4
	msc5: .word 5
	msc6: .word 6
	msc7: .word 7
	msc8: .word 8
	
.text
.main:
	# salvando o endereço de musics em $t0
	la $t0, musics
	
	# adicionando as oito músicas em musics
	la $t1, msc1
	sw $t1, 0($t0)
	
	la $t1, msc2
	sw $t1, 4($t0)
	
	la $t1, msc3
	sw $t1, 8($t0)
	
	la $t1, msc4
	sw $t1, 12($t0)
	
	la $t1, msc5
	sw $t1, 16($t0)
	
	la $t1, msc6
	sw $t1, 20($t0)
	
	la $t1, msc7
	sw $t1, 24($t0)
	
	la $t1, msc8
	sw $t1, 28($t0)
	
	# $t2 = tempo da música = 4
	li $t2, 4
	
	# $t3 = índice (4 em 4)
	li $t3, 0
	
	# $t4 = over (se over == 1, continua, se for igual à 0 para o loop)
	li $t4, 1
	
	# $s0 = música atual
	lw $s0, musics($t3)
	
	# $s1 = última música
	li $t5, 28
	lw $s1, musics($t5)

# laço de repetição principal
loop:
	# se $t4 == 0, acaba o loop e vai para exit
	beq $t4, $zero, exit
	
	# se não acabou, decrementa em 1
	subi $t2, $t2, 1
	
	# se o tempo da música acabar, vai para a label change_music
	beq $t2, $zero, change_music
	
	# loop
	j loop

# label para mudar a música
change_music:
	# chamando a função de pegar o novo índice
	jal get_index
	
	# movendo o novo índice novamente para $t3
	move $t3, $a0
	
	# guardando a música que está no índice $t3 em $s0
	lw $s0, musics($t3)
	
	# reinicia o tempo da música
	li $t2, 4
	
	# se a música $s0 for a última música ($s1), over ($t4) é igual à 1
	beq $s0, $s1, change_over

# função que retorna o índice da próxima música
get_index:
	addi $t3, $t3, 4
	move $a0, $t3
	
	jr $ra

# label para mudar o valor de $t4 (over)
change_over:
	# como acabou o while, $t4 recebe o valor de 1
	li $t4, 1

exit:
	# exit
	li $v0, 10
	syscall
