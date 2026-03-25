all: mnozenie

mnozenie.o: mnozenie.s
	as --32 --gstabs mnozenie.s -o mnozenie.o

mnozenie: mnozenie.o
	ld -m elf_i386 mnozenie.o -o mnozenie
