all: dodawanie odejmowanie mnozenie

dodawanie.o: dodawanie.s
	as --32 --gstabs dodawanie.s -o dodawanie.o

dodawanie: dodawanie.o
	ld -m elf_i386 dodawanie.o -o dodawanie

odejmowanie.o: odejmowanie.s
	as --32 --gstabs odejmowanie.s -o odejmowanie.o

odejmowanie: odejmowanie.o
	ld -m elf_i386 odejmowanie.o -o odejmowanie

mnozenie.o: mnozenie.s
	as --32 --gstabs mnozenie.s -o mnozenie.o

mnozenie: mnozenie.o
	ld -m elf_i386 mnozenie.o -o mnozenie
