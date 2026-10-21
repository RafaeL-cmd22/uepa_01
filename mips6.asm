.data 
	msg1: .asciiz "\nDigite o valor de A: "
	msg2: .asciiz "\nDigite o valor de B: "
	msg3: .asciiz "\nO valor de C é: "
.text
main:
#chama a mensagem 1
li $v0, 4
la $a0, msg1
syscall

#le o valor digitado
li $v0, 5
syscall
move $t0, $v0 #salva o valor A

#chama a mensagem 2
li $v0, 4
la $a0, msg2
syscall

#le o segundo valor digitado
li $v0, 5
syscall
move $t1, $v0 #salva o valor B

beq $t0, $t1, igual # se (A==B), igual:

mul $t2, $t0, $t1
j fim

igual:
add $t2, $t0, $t1 # soma A+B

fim:
#chama a mensagem 3
li $v0, 4
la $a0, msg3
syscall

#digita o valor de C
li $v0, 1
move $a0, $t2
syscall