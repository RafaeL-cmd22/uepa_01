.data 
	msg1: .asciiz "\nDigite um numero (negativo para encerrar): "
	msg2: .asciiz "\nNumeros entre [0 e 25]: "
	msg3: .asciiz "\nNumeros entre [26 e 50]: "
	msg4: .asciiz "\nNumeros entre [51 e 75]: "
	msg5: .asciiz "\nNumeros entre [76 e 100]: "
	msgerro: .asciiz "\nValor invalido, O numero não pode passar de 100."
.text
main:
li $s0, 0 # [0-25]
li $s1, 0 # [26-50]
li $s2, 0 # [51-75]
li $s3, 0 # [76-100]

programa:
#chama a mensagem 1
li $v0, 4
la $a0, msg1
syscall

#le o valor digitado
li $v0, 5
syscall
move $t0, $v0 #salva o valor digitado

blt $t0, 0, fim #verifica se o valor é negativo
bgt $t0, 100, erro #verifica se o valor é maior que 100

#reajusta os valores
ble $t0, 25, inc_int1 #se for menor ou igual 25 bloco 1
ble $t0, 50, inc_int2 #se for menor ou igual 50 bloco 2
ble $t0, 75, inc_int3 #se for menor ou igual 75 bloco 3
j inc_int4 #se não entrou em nenhum bloco entre 1 e 3 cai pro 4

inc_int1:
	addi $s0, $s0, 1 #soma um no contator do bloco 1
	j programa

inc_int2:
	addi $s1, $s1, 1 #soma um no contator do bloco 2
	j programa

inc_int3:
	addi $s2, $s2, 1 #soma um no contator do bloco 3
	j programa

inc_int4:
	addi $s3, $s3, 1 #soma um no contator do bloco 4
	j programa

erro: 
#mensagem de erro
li $v0, 4
la $a0, msgerro
syscall
j main

fim:
# Imprime valor no bloco 1
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $s0
syscall

# Imprime valor no bloco 2
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $s1
syscall

# Imprime valor no bloco 3
li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $s2
syscall

# Imprime valor no bloco 4
li $v0, 4
la $a0, msg5
syscall

li $v0, 1
move $a0, $s3
syscall