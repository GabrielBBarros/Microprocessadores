1A)

CLD
MOV AL, A4
MOV CL, 20
MOV DI, 200
REPNE SCASB -> Compara Strings de Byte na memória 
DEC DI
JZ xxx 
MOV BX, DI
MOV AL, 00
INT 20

-> MOV BX, DI
   MOV AL, 01
   INT 20

________________________________________________________________________________________________________________

1B)

MOV CL, 20
