# L'ISTAT ha rivisto le stime dell'aspettativa di vita (life expentancy, LE) della popolazione 
# italiana in 84.8 per le donne e 80.5 per gli uomini.
# Realizzare un programma in assembly MIPS che acquisca da input un carattere F o M per 
# discriminare il genere di un campione e un valore intero che rappresenta l'età e determinare se 
# il campione immesso ha superato la media oppure no. Il programma termina quando l'utente inserisce il carattere X
# ESEMPIO
# F;85;M;80;M;82;F;45;X
# OUTPUT
# OLTRE LA MEDIA LE; SOTTO LA MEDIA LE; OLTRE LA MEDIA LE; SOTTO LA MEDIA LE

.eqv eta, $t2

.text
.globl main

main: 

#	Definisce caratteri per terminare il programma X
	li $t8, 88

#	Carica stime definite in memoria
	lwc1 $f1, fle
	lwc1 $f2, mle
CICLO:
#	Lettura di un carattere da input
	li $v0, 12
	syscall
	
	addiu $t0, $v0, 0
	
#	Se il carattere è X termina		
	beq $t0, $t8, EXIT
	
#	Aquisisce intero da input
	li $v0, 5
	syscall
	move eta, $v0
	
#	Memorizza il valore di input in memoria
	la $a1, preser
	sw eta, ($a1)

#	Carica e converte il valore di input in float
	lwc1 $f3, ($a1)
	cvt.s.w $f3, $f3

#	Definisce carattere F
	li $t9, 70
			
#	Controlla se il valore char è F
	bne $t0, $t9, SETM

#	Sposta il valore standard per le donne su $f0
	mov.s $f0, $f1

CHECK:
#	Se il valore standard è minore, la condition flag 0 è vera
	c.lt.s  $f0, $f3
	bc1t OLTREOUTPUT
#	Stampa SOTTO LA MEDIA
	la $a0, str_down
	li $v0, 4
	syscall 
	j CICLO

OLTREOUTPUT:
#	Stampa OLTRE LA MEDIA
	la $a0, str_up
	li $v0, 4
	syscall
	j CICLO 
EXIT: 

	
#	Termine del programma
	li $v0, 10 
	syscall
	
SETM:
#	Definisce carattere M
	li $t9, 77
			
#	Controlla se il valore char è M
	bne $t0, $t9, EXIT
	
#	Sposta il valore standard per gli uomini su $f0
	mov.s $f0, $f2
	j CHECK
.data
fle: .float 84.8
mle: .float 80.5
str_up: .asciiz "OLTRE LA MEDIA LE; "
str_down: .asciiz "SOTTO LA MEDIA LE; "
preser: .space 4