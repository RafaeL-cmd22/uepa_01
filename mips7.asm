.data 
	msg1: .asciiz "\nDigite um valor: "
	msg2: .asciiz "\n"
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

rem $t0, $t0, 2 # deixa o resto da divisão 
beq $t0, 0, par #verifica se o resto é 0

impar:
addi $t0, $t0, 8 # soma 8 no valor
j fim

par:
addi $t0, $t0, 5 # soma 5 no valor

fim:
#chama a mensagem 2
li $v0, 4
la $a0, msg2
syscall

#digita o valor
li $v0, 1
move $a0, $t0
syscall