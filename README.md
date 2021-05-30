# ARCHITETTURA DEGLI ELABORATORI
## Anno 2020/2021



### [Esercizi I](https://github.com/samuel-greco/ArchitetturaDegliElaboratori/tree/main/Esercizi_1)

**Traccia 2**
Implementare il seguente programma: $t0=1 se il valore della variabile Batman (definita in memoria) è maggiore del valore della variabile Robin (definita in memoria)

**Traccia 3**
Implementare il seguente programma: $t0=1 se il valore della variabile Memole, definita in memoria, ha alla terza posizione meno significativa un 1.

**Traccia 7**
Si scriva un programma in linguaggio assembly MIPS che legga da tastiera una serie di numeri interi fino a quando la somma di tutti i numeri introdotti ﬁno a quel momento non supera il valore 1000. A quel punto, il programma stampa il valore del prodotto di tutti i numeri inseriti.
NB:la stampa deve avvenire da consolle output dell'emulatore MARS


**Traccia 8**
Un utente inserisce da tastiera una serie di numeri interi positivi, ed il termine della serie è indicato dall’inserimento del valore -1. Il programma in linguaggio assembly MIPS, al termine dell’inserimento, stampa quanti numeri in totale sono stati inseriti
NB:la stampa deve avvenire da consolle output dell'emulatore MARS

**Traccia 10**
Un utente introduce da tastiera due numeri interi (INIT e LUNG). Il programma in linguagguo assembly MIPS deve stampare una serie di numeri interi consecutivi. La serie inizia al valore INIT ed è lunga LUN elementi.
Esempio:
INPUT:
7
4

OUTPUT: 7 8 9 

### [Esercizi II](https://github.com/samuel-greco/ArchitetturaDegliElaboratori/tree/main/Esercizi_2)

**Traccia 1**
Implementare un programma in linguaggio assembly MIPS che:
stampa a video “Primo numero: ” e prenda in input un numero a
stampa a video “Secondo numero: ” e prenda in input un numero b
stampa a video “Prodotto dei due numeri: ” e stampi a video axb

Esempio
OUTPUT: Primo Numero:
INPUT:5
OUTPUT:Secondo Numero:
INPUT:6
OUTPUT: Prodotto dei due numeri:30

**Traccia 2**
Implementare un programma in linguaggio assembly MIPS che legga da input un intero positivo dividendo (word) ed un intero positivo (word) divisore e restituisca in output il quoziente e resto della divisione a/b.
Esempio
INPUT (dividendo): 56
INPUT (divisore): 23
OUTPUT: Quoziente: 2 Resto:10

### [Esercizi III](https://github.com/samuel-greco/ArchitetturaDegliElaboratori/tree/main/Esercizi_3)

**Traccia 1**
Implementare un programma in linguaggio assembly MIPS che dati cinque interi positivi definiti in memoria calcola la media aritmetica
Esempio
INPUT: a=0,b=11;c=7;d=1982;e=10051980
OUTPUT:2010796

**Traccia 2**
Implementare un programma in linguaggio assembly MIPS che legga da input un intero positivo  a>2 (word) ed un intero  positivo (word) b>1 e ne restituisca in output il prodotto (axb) senza utilizzare l'istruzione mul.
Esempio
INPUT (a): 10
INPUT (b): 5
OUTPUT: 50

**Traccia 4**
Dato un intero positivo a definito in memoria, stampare a video "Terzo bit 1" nel caso in cui il terzo bit del numero a sia 1 o  "Terzo bit 0" altrimenti

### [Esercizi IV](https://github.com/samuel-greco/ArchitetturaDegliElaboratori/tree/main/Esercizi_4)

**Traccia 1**
Leggere 7 valori interi da input e calcolarne la media (stampandola a video).
INPUT
12;82;11;2345;67;123456;675

OUTPUT
18092.57142857
NB: La media deve essere espressa con un numero reale (float). Utilizzare il coprocessore matematico. 

**Traccia 2**
Effettuare la sommatoria di numeri reali poistivi immessi da input. La sommatoria è calcolata quando il valore immesso dall'utente è nullo o negativo.

INPUT
3.5;7.23;5.6;9.17;-1

OUTPUT
25.5

**Traccia 3**
L'ISTAT ha rivisto le stime dell'aspettativa di vita (life expentancy, LE) della popolazione italiana in 84.8 per le donne e 80.5 per gli uomini.
Realizzare un programma in assembly MIPS che acquisca da input un carattere F o M per discriminare il genere di un campione e un valore intero che rappresenta l'età e determinare se il campione immesso ha superato la media oppure no. Il programma termina quando l'utente inserisce il carattere X
ESEMPIO
F;85;M;80;M;82;F;45;X
OUTPUT
OLTRE LA MEDIA LE; SOTTO LA MEDIA LE; OLTRE LA MEDIA LE; SOTTO LA MEDIA LE
