# Scrivere un programma in linguaggio assembly MIPS che riceve in ingresso una sequenza di N numeri interi.
# I numeri sono memorizzati in un vettore. Il valore N è inserito dall’utente, ma il vettore può contenere al massimo 30 numeri.
# Terminato l’inserimento della sequenza di numeri, il programma deve verificare se gli elementi del vettore
#sono tutti uguali tra loro.

.eqv N, $t1
.eqv ITER, $t2

.text
.globl main

main:
#	Definisce varibile di iterazione e carica l'indirizzo in memoria del vettore
	li ITER, 0
	la $t3, vettore
	
#	Stampa stringa
	la $a0, str_getn
	
	li $v0, 4
	syscall
#	Acquisisci numero intero N
	li $v0, 5
	syscall
	move N, $v0
	ble N, 1,  EXIT	
CICLO:
#	Acquisisci numero intero
	li $v0, 5
	syscall
	
#	Memorizza input all'interno del vettore
	sw $v0, ($t3)
#	Aggiorna l'indirizzo del vettore alla prossima posizione
	add $t3, $t3, 4
#	Incrementa l'iteratore
	add ITER, ITER, 1
#	Riesegue il ciclo
	blt ITER, N, CICLO

#	Carica l'indirizzo del vettore in a0 come parametro per la subroutine
	la $a0, vettore
#	Sposta il valore di N in a1 come parametro per la subroutine
	move $a1, N
#	Richiama la subroutine
	jal CHECKEQUAL
	
#	Carica il valore di ritorno in a0 e lo stampa
#	Se i valori inseriti sono tutti uguali stampa 0, altrimenti 1
	move $a0, $v1
	
	li $v0, 1
	syscall
EXIT:

	li $v0, 10 
	syscall
	
	
CHECKEQUAL:
#	Prende l'address del vettore contenuto in a0
	move $t0, $a0
#	Prende il numero di iterazioni da effettuare da a1
	move $t1, $a1
#	Inizializza il registro con il valore di ritorno
	li $v1, 0
#	Inizializza l'iteratore
	li $t2, 1
#	Prende il primo numero del vettore
	lw $t3, ($t0)
	add $t0, $t0, 4
	
	FOR:
	#	Carica il prossimo numero dal vettore
		lw $t4, ($t0)
	#	Controlla il valore con il primo valore caricato
		bne $t3, $t4, SETNOT
	#	Aggiorna l'indirizzo di memoria del vettore per il prossimo elemento
		add $t0, $t0, 4
	#	Incrementa l'iteratore
		add $t2, $t2, 1
	#	Riesegue il for per N iterazioni
		blt $t2, $t1, FOR
	EXITCHECK:
	#	Torna alla normale esecuzione del programma
		jr $ra
	SETNOT:
	#	Se sono presenti dei valori differenti setta v1 a 1
		li $v1, 1
		j EXITCHECK
	
.data
vettore: .word 0:30
str_getn: .asciiz "Lunghezza vettore N: "