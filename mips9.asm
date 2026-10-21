.data 
	msg1: .asciiz "\nDigite o dividendo: "
	msg2: .asciiz "\nDigite o divisor: "
	msg3: .asciiz "\nO valor fica: "
	msg4: .asciiz "\nValor invalido, O divisor não pode ser 0."
.text
main:
#chama a mensagem 1
li $v0, 4
la $a0, msg1
syscall

#le o valor digitado
li $v0, 5
syscall
move $t0, $v0 #salva o primeiro valor

#chama a mensagem 2
li $v0, 4
la $a0, msg2
syscall

#le o valor digitado
li $v0, 5
syscall
move $t1, $v0 #salva o segundo valor

bne $t1, 0, certo #verifica se o valor segundo valor é 0
j erro

certo:
div $t0, $t0, $t1 # primeiro dividido pelo segundo valor
j fim

erro:
#chama a mensagem 4
li $v0, 4
la $a0, msg4
syscall
j main

fim:
#chama a mensagem 3
li $v0, 4
la $a0, msg3
syscall

#digita o valor
li $v0, 1
move $a0, $t0
syscall