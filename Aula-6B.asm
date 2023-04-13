mov ax, a000
mov ds, ax
mov word ptr[200], 1234
mov word ptr[202],abcd
mov ax, [200]
mov cx, [202]
mul cx
mov word ptr [204], dx
mov word ptr [206], ax