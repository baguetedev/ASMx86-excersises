SYSREAD = 3
STDIN = 0
SYSWRITE = 4
SUCCES = 1
EXIT_SUCCES = 0
STDOUT = 1

.data 
msg: .ascii "Write Text(5): \n"
msg_len = . - msg

msg2: .ascii "Written text: "
msg2_len = . - msg2

newline: .ascii "\n"
newline_len = . - newline

buf: .ascii "     "
buf_len = . - buf

.text 
.global _start
_start:
    # 1. Printuje write text
    mov $SYSWRITE, %eax
    mov $STDOUT, %ebx
    mov $msg, %ecx 
    mov $msg_len, %edx
    int $0x80

    # 2. czyta co jest w buf
    mov $SYSREAD, %eax
    mov $STDIN, %ebx
    mov $buf, %ecx
    mov $buf_len, %edx
    int $0x80

    # 3. Printuje "Written text: "
    mov $SYSWRITE, %eax
    mov $STDOUT, %ebx
    mov $msg2, %ecx
    mov $msg2_len, %edx
    int $0x80

    # Printuje to co z buf
    mov $SYSWRITE, %eax
    mov $STDOUT, %ebx
    mov $buf, %ecx
    mov $buf_len, %edx
    int $0x80

    # wyjscie
    mov $SUCCES, %eax
    mov $EXIT_SUCCES, %ebx
    int $0x80
