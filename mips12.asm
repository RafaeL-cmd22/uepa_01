.data 
	msg1: .asciiz "\nDigite a altura (em centímetros): "
	msg2: .asciiz "\nA maior altura é: "
	msg3: .asciiz "\nA menor altura é: "
.text
main:
#chama mensagem 1
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

move $t0, $v0 #maior
move $t1, $v0 #menor

li $t2, 14 #define o contador para 14 alturas restantes

contador:
beq $t2, 0, fim # Verifica se o contato chegou a 0

#chama mensagem 1 dnv
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t3, $v0 #regista a nova altura

#verifica se é maior que a altura anterior
ble $t3, $t0, menor #compara com a maior altura atual
move $t0, $t3 #se não pular é a nova maior
j continua

menor:
#verifica a menor altura
bge $t3, $t1, continua #se foi maior que a menor altura continua
move $t1, $t3 #se não é a nova menor

continua:
addi $t2, $t2, -1 #diminui 1 no contador
j contador

fim:
#chama a maior altura
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t0
syscall

#chama a menor altura
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t1
syscall