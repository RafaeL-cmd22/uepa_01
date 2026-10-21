.data 
	msg1: .asciiz "\nDigite o valor de horas trabalhadas: "
	msg2: .asciiz "\nDigite o valor de horas extras trabalhadas: "
	msg3: .asciiz "\nDigite o valor de desconto no salário: "
	msg4: .asciiz "\nO salário bruto fica: "
	msg5: .asciiz "\nO salário líquido fica: "
	msg6: .asciiz " R$"
.text
main:
	#chama a mensagem 1
	li $v0, 4
	la $a0, msg1
	syscall
	
	#le o valor digitado
	li $v0, 5
	syscall
	move $t0, $v0 #salva as horas trabalhadas
	
	#chama a mensagem 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#le o segundo valor digitado
	li $v0, 5
	syscall
	move $t1, $v0 #salva as horas extras trabalhadas
	
	
	#chama a mensagem 3
	li $v0, 4
	la $a0, msg3
	syscall
	
	#le o terceiro valor digitado
	li $v0, 5
	syscall
	move $t2, $v0 #salva o valor de desconto no salário
	
	#Multiplica as horas
	mul $t0, $t0, 10 # horas trabalhadas = horas trabalhadas * 10
	mul $t1, $t1, 15 # horas extras trabalhadas = horas extras trabalhadas * 15
	
	#soma todos os valores
	add $t0, $t0, $t1 # salario bruto = horas trabalhadas + horas extras trabalhadas
	sub $t1, $t0, $t2 # salario líquido = salario bruto - desconto
	
	#chama a mensagem 4
	li $v0, 4
	la $a0, msg4
	syscall
	
	#digita o valor do salario bruto
	li $v0, 1
	move $a0, $t0
	syscall
	
	#chama a mensagem 6
	li $v0, 4
	la $a0, msg6
	syscall
	
	#chama a mensagem 5
	li $v0, 4
	la $a0, msg5
	syscall
	
	#digita o valor do salario líquido
	li $v0, 1
	move $a0, $t1
	syscall
	
	#chama a mensagem 6
	li $v0, 4
	la $a0, msg6
	syscall