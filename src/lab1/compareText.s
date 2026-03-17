SYSREAD = 3
STDIN = 0
SYSWRITE = 4
SUCCES = 1
EXIT_SUCCES = 0
STDOUT = 1
TEXT_LEN = 5

.data 
msg: .ascii "Podaj tekst (5): "
msg_len = . - msg

msg_ok: .ascii "Teksty sa identyczne!\n"
msg_ok_len = . - msg_ok

msg_fail: .ascii "Teksty sie roznia!\n"
msg_fail_len = . - msg_fail

secret: .ascii "epste" 

.bss
.lcomm buf, 5 

.text 
.global _start
_start:
    mov $SYSWRITE, %eax
    mov $STDOUT, %ebx
    mov $msg, %ecx 
    mov $msg_len, %edx
    int $0x80

    mov $SYSREAD, %eax
    mov $STDIN, %ebx
    mov $buf, %ecx
    mov $TEXT_LEN, %edx
    int $0x80

    mov $0, %esi             

compare_loop:
    movb buf(%esi), %al      
    cmpb secret(%esi), %al   
    jne not_equal            

    inc %esi                 
    cmp $TEXT_LEN, %esi      
    jne compare_loop         




equal:
    mov $SYSWRITE, %eax
    mov $STDOUT, %ebx
    mov $msg_ok, %ecx
    mov $msg_ok_len, %edx
    int $0x80
    jmp exit_prog            
not_equal:
    mov $SYSWRITE, %eax
    mov $STDOUT, %ebx
    mov $msg_fail, %ecx
    mov $msg_fail_len, %edx
    int $0x80

exit_prog:
    mov $SUCCES, %eax
    mov $EXIT_SUCCES, %ebx
    int $0x80
