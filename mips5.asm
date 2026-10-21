.data 
	msg1: .asciiz "\nDigite o valor de A: "
	msg2: .asciiz "\nDigite o valor de B: "
	msg3: .asciiz "\nA hipotenusa é: "
.text
main:
#chama a mensagem 1
li $v0, 4
la $a0, msg1
syscall

#le o valor digitado
li $v0, 5
syscall
move $t0, $v0 #salva valor A

#chama a mensagem 2
li $v0, 4
la $a0, msg2
syscall

#le o segundo valor digitado
li $v0, 5
syscall
move $t1, $v0 #salva valor B

#Calcula a hipotenusa
mul $t0, $t0, $t0 # A **2
mul $t1, $t1, $t1 # B **2
add $t0, $t0, $t1 # A + B

loop_raiz:
mul $t3, $t2, $t2 # $t3 = hipotenusa^2
bge $t3, $t0, fim # Se (hipotenusa^2 >= $t0) fim
addi $t2, $t2, 1 # Soma +1 no candidato a hipotenusa
j loop_raiz # Repete o loop

fim:
#chama a mensagem 3
li $v0, 4
la $a0, msg3
syscall

#digita o valor da área
li $v0, 1
move $a0, $t2
syscall
