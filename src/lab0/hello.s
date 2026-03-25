SYSWRITE = 4
STDOUT = 1
SUCCES = 1
EXIT_SUCCES = 0

.text
msg: .ascii "hello world! \n"
len = . - msg

.global _start
_start:
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg, %ecx 
mov $len, %edx
int $0x80

#koniec
mov $SUCCES, %eax
mov $EXIT_SUCCES, %ebx
int $0x80

