Faça um programa que multiplica um valor de
16 bits, guardado na posição 200 do segmento de memória
A000 pelo valor de 16 bits, guardado na posição 202 do mesmo
segmento de memória. O resultado (32 bits) deve ser colocado
no endereço de memória 204.


mov ax, a000
mov ds, ax
mov word ptr[200], 1234
mov word ptr[202],abcd
mov ax, [200]
mov cx, [202]
mul cx
mov word ptr [204], dx
mov word ptr [206], ax
