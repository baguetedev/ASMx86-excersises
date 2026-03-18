.code32

.data
rozmiar: .long 4
liczba1: .long 0x10304008, 0x701100FF, 0x45100020, 0x08570030
liczba2: .long 0xF040500C, 0x00220026, 0x321000CB, 0x04520031

.bss
.lcomm wynik, 32

.text
.global _start

_start:
    movl $0, %esi

petla_zewnetrzna:
    cmpl rozmiar, %esi
    je koniec_mnozenia
    
    movl $0, %edi

petla_wewnetrzna:
    cmpl rozmiar, %edi
    je nastepny_zewnetrzny

    movl liczba2(,%esi,4), %eax
    mull liczba1(,%edi,4)

    movl %esi, %ebx
    addl %edi, %ebx

    addl %eax, wynik(,%ebx,4)

    incl %ebx
    adcl %edx, wynik(,%ebx,4)

    jnc po_przeniesieniu
propaguj_dalej:
    incl %ebx
    adcl $0, wynik(,%ebx,4)
    jc propaguj_dalej

po_przeniesieniu:
    incl %edi
    jmp petla_wewnetrzna

nastepny_zewnetrzny:
    incl %esi
    jmp petla_zewnetrzna

koniec_mnozenia:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
