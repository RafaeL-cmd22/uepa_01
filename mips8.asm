.data 
	msg1: .asciiz "\nDigite um valor: "
	msg2: .asciiz "\nO valor fica: "
	msg3: .asciiz "\nValor invalido."
.text
main:
#chama a mensagem 1
li $v0, 4
la $a0, msg1
syscall

#le o valor digitado
li $v0, 5
syscall
move $t0, $v0 #salva o valor

beq $t0, 0, erro #verifica se o valor é 0
blt $t0, 0, negativo #verifica se o valor é negativo ou positivo

positivo:
mul $t0, $t0, 2 # multiplica por 2
j fim

negativo:
mul $t0, $t0, 3 # multipica por 3
j fim

erro:
#chama a mensagem 3
li $v0, 4
la $a0, msg3
syscall
j main

fim:
#chama a mensagem 2
li $v0, 4
la $a0, msg2
syscall

#digita o valor
li $v0, 1
move $a0, $t0
syscall