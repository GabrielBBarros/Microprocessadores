1) (PILHA) Digite o programa abaixo no DEBUG e, execute
ele, acompanhando o valor de SP, antes e após a
execução das instruções de pilha (Push e Pop)

I)    mov ax,1234
II)   mov bx,5678
III)  mov cx, 9abc
IV)   push ax
V)    push bx
VI)   push cx
VII)  pop ax
VIII) pop bx
IX)   pop cx


            => CX   -> AX
      => BX => BX   -> BX
=> AX => AX => AX   -> CX

AX = CX
BX = BX
CX = AX

AX = 9ABC
BX = 5678
CX = 1234
_______________________________________________________________________________________________________________

2) (Segmento de Dados) Digite o programa abaixo no DEBUG e, execute
ele, acompanhando os valores na memória
I)    mov cx,ABCD // CX=ABCD
II)   mov dx,AABB // DX=AABB
III)  mov ax,A000 // AX=A0000
IV)   mov ds,ax // DS=AX (DX não pode receber um valor diretamente)
V)    mov ax,ac00 // AX=AC00
VI)   mov es,ax // ES=AX (EX não pode receber um valor diretamente)
VII)  mov [100],cx // Endereço DS:100 = CX
VIII) mov es:[100],dx // Endereço ES:100 = DX

Execute linha a linha com o comando t. Antes de executar a linha 7, veja o que há
no endereço de destino com o comando d a000:100. Em seguida, execute a linha 7
(usando o comando t) e, novamente veja se o valor de CX foi colocado lá (usando
o comando d a000:100).
Antes de executar a linha 8, veja o que há no endereço de destino com o comando
d ac00:100. Em seguida, execute a linha 8 (usando o comando t) e, novamente
veja se o valor de DX foi colocado lá (usando o comando d ac00:100).  

I)    CX = ABCD
II)   DX = AABB
III)  AX = A000
IV)   DS = A000
V)    AX = AC00
VI)   ES = AC00
VII)  Estado primariamente zerado e depois com os valores CDAB
VIII) Antes zerado e posteriomente com o valor BBAA   



_______________________________________________________________________________________________________________
3) (BITS) Faça o teste de mesa no programa abaixo, para
saber o valor final, guardado em AX. Em seguida, digite o
programa no DEBUG e, execute ele, para ver se o valor
previsto está correto.

I)    mov AX,3BA7 // ax=aba7
II)   mov BX,FF00 // bx=ff00
III)  add AX,BX // ax = aba7+ff00 vai gerar o vai-um (carry)
IV)   rcr al,1 // rotaciona usando o carry anterior
V)    rol al,1 // rotaciona
VI)   mov cl,4 // cl=4
VII)  rcr al,cl // rotaciona al 4 vezes usando o carry
VIII) shl ah,1 // desloca ah para a esquerda

I)    AX = 3BA7
II)   BX = FF00
III)  AX = 3AA7
IV)   AL = 1010 0111 [1] => 1010 0111 [1] = D3
V)    AL = 1101 0011 => 1010 0111 [1] = A7
VI)   CL = 4
VII)  AL = 1010 0111 1
           1101 0011 1
           1111 1001 1
           1111 0100 0
           1111 1010 0 => FA
VII)  3A*2 = 74


AX = 74FA
BX = FF00
CX = 0004

_________________________________________________________________________________________________________________
4) (LÓGICA) Faça o teste de mesa no programa abaixo,
para saber o valor final, guardado em AX e BX. Em
seguida, digite o programa no DEBUG e, execute ele, para
ver se o valor previsto está correto.

I)    mov AX,25FB
II)   mov BX,3210
III)  and AX,BX
IV)   or BX,AX
V)    not BX
VI)   xor AX,BX


I)   AX = 25FB
II)  BX = 3210
III) 25FB = 0010 0101 1111 1011 
AND  3210 = 0011 0010 0001 0000 =>
            0010 0000 0001 0000 => AX = 2010

IV)  2010 = 0010 0000 0001 0000
OR   3210 = 0011 0010 0001 0000 =>
            0011 0010 0001 0000 => 3210 => BX
            
V)   NOT BX = 1100 1101 1110 1111 => CDEF

VI)  2010 = 0010 0000 0001 0000
XOR  CDEF = 1100 1101 1110 1111 =>
            1110 1101 1111 1111 = EDFF
            
AX = EDFF
BX = CDEF

_______________________________________________________________________________________________________________
5)  Faça um programa que multiplica um valor de
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
