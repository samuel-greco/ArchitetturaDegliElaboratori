# Effettuare la sommatoria di numeri reali poistivi immessi da input. 
# La sommatoria è calcolata quando il valore immesso dall'utente è nullo o negativo.
# INPUT
# 3.5;7.23;5.6;9.17;-1
# OUTPUT
# 25.5


.text
.globl main

main: 
#	Carica il valore da non oltrepassare dalla memoria
	lwc1 $f2, basen
	
INPUT:
#	Lettura di valori reali float in singola precisione
	li $v0, 6
	syscall

#	Verifica se il valore inserito è minore di 1
	c.lt.s $f0, $f2

#	Salta ad EXIT se la condition flag 0 è true
	bc1t EXIT

#	Aggiunge il valore alla somma e riesegue
	add.s $f1, $f1, $f0
	j INPUT
	
EXIT:
#	Sposta il valore della somma nel registro per l'output
	mov.s $f12, $f1
	
#	Stampa l'output
	li $v0, 2
	syscall 

#	Termine del programma
	li $v0, 10
	syscall

.data
basen: 1
