;Program to add and subtract two 8-bit signed integers

.model  small
.stack 100H
.data
a db 20h
b db 10h
.code
main proc
mov ax,@data
mov ds,ax
mov al,a
add al,b
mov al,a
sub al,b
mov ax,4c00h
int 21h
main endp
end main