# Implementare in linguaggio asembly MIPS un programma che calcola il massimo tra n elementi
# immessi in input (la lettura termina quando si introduce un numero negativo.
# Utilizzare la sub-routine (funzione) MASSIMO che presi due elementi restituisce il massimo.

.text
.globl main
main:

READVETT:
#	Leggi intero, se negativo concludi il ciclo 
	li $v0, 5
	syscall
	
	blt $v0, 0, exit

#	Imposta i parametri per la subroutine MASSIMO
	move $a0, $v0
	move $a1, $a2
	
	jal MASSIMO
#	Preleva il valore di ritorno
	move $a2, $v1
	j READVETT


exit:
#	Stampa valore massimo e termina il programma
	li $v0, 1
	move $a0, $a2
	syscall 
	
	li $v0, 10
	syscall



MASSIMO:
#	$a0 -> primo elemento 
#	$a1 -> secondo elemento
#	$v1 -> massimo
	move $t0, $a0
	move $t1, $a1
	
	bgt $t0, $t1, setf
	move $v1, $t1
endmassimo: 
	jr $ra
setf:
	move $v1, $t0
	j endmassimo

.data
