# Leggere 7 valori interi da input e calcolarne la media (stampandola a video).

# INPUT
# 12;82;11;2345;67;123456;675

# OUTPUT
# 18092.57142857
#NB: La media deve essere espressa con un numero reale (float). Utilizzare il coprocessore matematico. 

.eqv N, $t1
.eqv CONT, $t2
.eqv SOMMA, $f1

.text
.globl main

main:
#	Caricamento dei valori e inizializzazione
	lw N, nvalori
	li CONT, 0
	
GETINPUT:
#	Leggo valore float da tastiera
	li $v0, 6
	syscall
#	Aggiungo la somma float
	add.s SOMMA, SOMMA, $f0
	
#	Incremento il contatore
	add CONT, CONT, 1
#	Verifico la condizione per il for
	blt CONT, N, GETINPUT

#	Carico la word contenente il numero di valori all'interno del coprocessore matematico
	lwc1 $f2, nvalori
	
#	Converto la word caricata in float
	cvt.s.w $f3, $f2

#	Eseguo la divisione impostando il valore sul registro specifico per l'output e lo stampo
	div.s $f12, SOMMA, $f3
	
	li $v0, 2
	syscall
	
	
#	Termine del programma
	li $v0, 10
	syscall
	
	
	
.data
nvalori: .word 7