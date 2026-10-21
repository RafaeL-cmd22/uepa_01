.data
	msg1: .asciiz "\nDigite o comprimento do terreno em metros: "
	msg2: .asciiz "\nDigite a largura do terreno em metros: "
	msg3: .asciiz "\nA área do terreno é: "
	msg4: .asciiz " m²"
.text
main:
	#chama a mensagem 1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#le o valor digitado
	li $v0, 5
	syscall
	move $t0, $v0 #salva o comprimento
	
	#chama a mensagem 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#le o segundo valor digitado
	li $v0, 5
	syscall
	move $t1, $v0 #salva a largura
	
	#calcula a área do terreno
	mul $t2, $t0, $t1
	
	#chama a mensagem 3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#digita o valor da área
	li $v0, 1
	move $a0, $t2
	syscall
	
	#chama a mensagem 4
	li $v0, 4
	la $a0, msg4
	syscall