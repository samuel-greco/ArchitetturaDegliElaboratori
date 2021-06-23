# Implementare un programma in linguaggio assembly MIPS
# che definiti R (numero di righe) e C (numero di colonne) rispettivamente in $t0 e $t1,
# stampa in maniera leggibile e conforme alla struttura tabellare una matrice MRxC definita in memoria.

# Calcolo elemento in matrice
#	C(r-1)+(c-1)

#	11 12 13
#	21 22 23
#	31 32 33

.eqv R, $t2
.eqv C, $t3

.text
.globl main
main:
#	Definisci righe e colonne totali
	li $t0, 3
	li $t1, 3
#	Definisci indici R e C
	li R, 1
	li C, 1
	
ciclo:
#	Calcola posizione RC
	sub $t9, R, 1
	sub $t8, C, 1
	
	mul $t7, $t1, $t9
	add $t6, $t7, $t8
	mul $t6, $t6, 4

#	Preleva elemento ed effettua la stampa con l'aggiunta di uno spazio
	lw $a0, mat($t6)
	
	li $v0, 1 
	syscall
	
	la $a0, space
	li $v0, 4
	syscall

#	Incrementa indice colonna e controllo se continuare le iterazioni
	addi C, C, 1
	ble C, $t1, ciclo

#	Incrementa indice riga, stampa un newline e itera se necessario
	addi R, R, 1
	li C, 1
	
	la $a0, newr
	li $v0, 4
	syscall
	
	ble R, $t0, ciclo
exit:
	li $v0, 10
	syscall
.data
mat: .word 1, 2, 3, 4, 5, 6, 7, 8, 9
space: .asciiz " "
newr: .asciiz "\n"