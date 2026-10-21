.data 
	msg1: .asciiz "\nDigite o primeiro valor: "
	msg2: .asciiz "\nDigite o segundo valor: "
	msg3: .asciiz "\nO resto da divisao fica: "
	msg4: .asciiz "\nValor invalido, O nenhum valor pode ser 0."
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

#reajusta os valores
bge $t0, $t1, conta # verifica se o primeiro valor é maior ou igual ao segundo valor
move $t2, $t0 # Guarda o primeiro valor
move $t0, $t1 # $t0 recebe o segundo valor (maior)
move $t1, $t2 # $t1 recebe o primeiro valor (menor)


conta:
beq $t1, 0, erro # verifica se o menor numero não é 0

div $t2, $t0, $t1 # divide o maior pelo menor

mul $t1, $t1, $t2 # multiplica o menor pelo quociente

sub $t0, $t0, $t1 # descobri o resto subtraindo o maior pela multiplicação do menor com o quociente
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