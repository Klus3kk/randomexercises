%include "AuxMacros.asm"
section .text
global _start
_start: 
 mov ax, 21
 mov bx, 28
whi: cmp ax, bx
 je fin
 jle els
 sub ax, bx ; mov ax, 5
 call od
 mov ax, 2
 mov bx, 2
 jmp whi
els: sub bx, ax ; mov bx, 5
od: call whi
 mov ax, 6
 mov bx, 6
 jmp whi
fin: printReg ax
 printReg bx
 return0
section .data
HexDig db '0', '1', '2', '3'
 db '4', '5', '6', '7'
 db '8', '9', 'A', 'B'
 db 'C', 'D', 'E', 'F'
msg db '12 = 0000', 0xa
len equ $ - msg
