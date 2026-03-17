.code32

.data
rozmiar: .long 4
liczba1: .long 0x10304008, 0x701100FF, 0x45100020, 0x08570030
liczba2: .long 0xF040500C, 0x00220026, 0x321000CB, 0x04520031

.bss
.lcomm wynik, 20

.text
.global _start

_start:
    movl rozmiar, %ecx
    movl $0, %esi
    clc

dodawanie_petla:
    movl liczba1(,%esi,4), %eax
    adcl liczba2(,%esi,4), %eax
    movl %eax, wynik(,%esi,4)
    
    incl %esi
    loop dodawanie_petla

    movl $0, %eax
    jnc koniec_dodawania
    movl $1, %eax

koniec_dodawania:
    movl %eax, wynik(,%esi,4)

    movl $1, %eax
    movl $0, %ebx
    int $0x80
