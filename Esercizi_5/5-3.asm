# Un programma in linguaggio assembly MIPS deve inizializzare quindici valori interi
# e calcolare la media aritmetica (si deve usare il coprocessore matematico)
# degli elementi alla posizioni pari, alla posizioni dispari e quella complessiva.

.eqv INDEX, $t0
.eqv LUN, $t1
.eqv ACCESS, $t2
.eqv ELEMENT, $t3
.eqv REMAINDER, $t4
.text
.globl main
main:
	# Itera il vettore
	li INDEX, 0
	lw LUN, lunvett
	
	li $t8, 8
	li $t7, 7
	
	mtc1 $t8, $f8
	mtc1 $t7, $f7
	
	cvt.s.w $f8, $f8
	cvt.s.w $f7, $f7
	
	
ciclo:
	mul ACCESS, INDEX, 4
	lw ELEMENT, vettore1(ACCESS)
	
	# Sposta l'elemento nel coprocessore 
	mtc1 ELEMENT, $f0
	# Converti l'elemento in float
	cvt.s.w $f1, $f0
	# Aggiungi alla somma totale
	add.s $f2, $f2, $f1
	
	# Controlla se l'indice è pari o dispari 
	rem REMAINDER, INDEX, 2
	
	beqz REMAINDER, salvapari
	
	add.s $f6, $f6, $f1
continue:
	add INDEX, INDEX, 1
	blt INDEX, LUN, ciclo
	
	mtc1 LUN, $f3
	cvt.s.w $f3, $f3
	# Calcola la media totale
	div.s $f4, $f2, $f3
	 
	# Calcola la media posizioni pari presenti sul registro $f5
	 div.s $f5, $f5, $f8
	
	# Calcola la media posizioni dispari presenti sul registro $f6
	div.s $f6, $f6, $f7
	
	li $v0, 10
	syscall
	
salvapari:
	add.s $f5, $f5, $f1
	jal continue


.data
vettore1: .word 2, 4, 5, 6, 12, 7, 3, 9, 13, 10, 1, 1, 15, 11, 0
lunvett: .word 15
