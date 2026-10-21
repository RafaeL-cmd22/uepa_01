.data 
	msg1: .asciiz "\nDigite quantas camisas pequenas você quer: "
	msg2: .asciiz "\nDigite quantas camisas médias você quer: "
	msg3: .asciiz "\nDigite quantas camisas grandes você quer: "
	msg4: .asciiz "\nO valor total fica: "
	msg5: .asciiz " R$"	
.text
main:
	#chama a mensagem 1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#le o valor digitado
	li $v0, 5
	syscall
	move $t0, $v0 #salva as camisas pequenas
	
	#chama a mensagem 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#le o segundo valor digitado
	li $v0, 5
	syscall
	move $t1, $v0 #salva as camisas medias
	
	
	#chama a mensagem 3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#le o terceiro valor digitado
	li $v0, 5
	syscall
	move $t2, $v0 #salva as camisas grandes
	
	#Multiplica as camisas pelo valor
	mul $t0, $t0, 10 # camisas pequenas = $t0 * 10
	mul $t1, $t1, 12 # camisas medias = $t1 * 12
	mul $t2, $t2, 15 # camisas grandes = $t2 * 15
	
	#soma todos os valores
	add $t0, $t0, $t1 # camisas pequenas = camisas pequenas + camisas medias
	add $t0, $t0, $t2 # camisas pequenas+medias = camisas pequenas+medias + camisas grandes
	
	#chama a mensagem 4
	li $v0, 4
	la $a0, msg4
	syscall
	
	#digita o valor das camisas
	li $v0, 1
	move $a0, $t0
	syscall
	
	#chama a mensagem 5
	li $v0, 4
	la $a0, msg5
	syscall
