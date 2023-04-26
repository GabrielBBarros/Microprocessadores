1) Dado o programa abaixo, calcule os valores
de AX, BX e CX após a sua execução.


I)    mov AX,109
II)   mov BX,34
III)  mov CX,37ff
IV)   mul CL
V)    add AX, BX
VI)   div CH
VII)  sub CX,AX
VIII) ror AL,1
IX)   add AL,CL
X)    add AL,BL
XI)   rcr AL,1


I)    AX=109
II)   BX=34
III)  CX = 37FF
IV)   AX = 8F7
V)    AX = 92B
VI)   37FF/37 => AX=252A
VII)  15+D5 => AL=EA
VIII) RCR = 0001 1110 1 => 1000 1111 0 => AL=8F
