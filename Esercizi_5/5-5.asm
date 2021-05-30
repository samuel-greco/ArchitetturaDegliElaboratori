# Scrivere un programma in linguaggio assembly MIPS che legga una stringa introdotta da tastiera.
# La stringa contiene sia caratteri maiuscoli che caratteri minuscoli, e complessivamente al più 255 caratteri.
# Il programma deve svolgere le seguenti operazioni:
# visualizzare la stringa inserita
# stampare a video l'uppercase della stringa 
# Ad esempio la frase "Che Bella Giornata" diviene "CHE BELLA GIORNATA". 


.text
.globl main

main:
#	Carico l'indirizzo di partenza della stringa
	la $s0, str1
	
SCORRI: 
#	Carico il carattere memorizzato 	
	lb $s1, ($s0)
	
	beqz $s1, EXIT
	
	blt $s1, 91, STAMPA
	sub $s1, $s1, 32
	
STAMPA: 	
	move $a0, $s1
	jal STAMPACHAR
	
	add $s0, $s0, 1
	
	j SCORRI
	
	
EXIT:
	li $v0, 10
	syscall


STAMPACHAR:
	li $v0, 11
	syscall
	jr $ra

.data
str1: .asciiz "Che Bella Giornata"