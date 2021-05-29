# TRACCIA 2
# Implementare il seguente programma: $t0=1 se il valore della variabile Batman (definita in memoria) 
# è maggiore del valore della variabile Robin (definita in memoria)



.text
.globl main


main: 

# Carichiamo le variabili definite in memoria

lw $t1, Batman
lw $t2, Robin

bgt $t2, $t1, exit

li $t0, 1 


exit:
	li $v0, 10
	syscall


.data
Batman: .word 10
Robin: .word 38