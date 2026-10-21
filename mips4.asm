.data 
	msg1: .asciiz "\nDigite a altura do trapézio: "
	msg2: .asciiz "\nDigite o valor da base menor: "
	msg3: .asciiz "\nDigite o valor da base maior: "
	msg4: .asciiz "\nA área do trapézio é: "
.text
main:
	#chama a mensagem 1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#le o valor digitado
	li $v0, 5
	syscall
	move $t0, $v0 #salva a altura
	
	#chama a mensagem 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#le o segundo valor digitado
	li $v0, 5
	syscall
	move $t1, $v0 #salva a base menor
	
	
	#chama a mensagem 3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#le o terceiro valor digitado
	li $v0, 5
	syscall
	move $t2, $v0 #salva a base maior
	
	#Calcula a área do trapezio

	add $t1, $t2, $t1 # $t1 = base maior + base menor
	mul $t1, $t1, $t0 # soma das bases * altura
	div $t1, $t1, 2 # (soma das bases * altura)/2
		
	#chama a mensagem 4
	li $v0, 4
	la $a0, msg4
	syscall
	
	#digita o valor da área
	li $v0, 1
	move $a0, $t1
	syscall
	