# Microprocessadores
Alguns arquivos de exercicios e teoria de microprocessadores

# Teoria

## Entendimento básico e operações


### Processadores e plataforma

   Nesa parte trabalharemos com processadores da Intel 8088 e 8086, a grande diferença de um e outro se encontra no seu barramente (onde se manioula os dados), onde o 8088 possui apenas dois barramentos de 8 bits e o 8086 possui um de 16 bits, nesse caso o 8086 precisa apenas de uma operação para manipular dados de 16 bits, enquanto o 8088 precisa de duas. Aqui utilizaremos a plataforma DosBox para fazer os nossos códigos.
   
### Principais comandos
   
| Comando | Função | 
| --- | --- |
| r | Mostra registradores | 
| q | Sai do Debug |
| a | Começa linha |
| u | Vizualiza programa |
| t | Prosegue execução linha alinha | 
| n| Nomeia programa | 
| w | Escreve | 
| e | Edita | 
| g | Vários Ts | 
| int 20 | Interrompe programa | 

### Como começo
   
   Para facilitar escreve apenas assim nos primeiros comando do debug
        
      debug
      a 100

### Registradores Gerais

   Aqui possuimos 4 registrsadores, sendo eles AX,BX,CX ou DX (podemos escrever em minusculo também). É importante ressaltar dias coisas importantes, a primeira delas é que cada registrador possui uma parte alta (H) e uma parte baixa (L) armazenando menos capacidade que um inteiro, o outro ponto se diz respeito ao seu uso, cada um tem um uso especifico, em caso de armazenamento e lugares errados isso pode acarretar em perca de dados.
   
## Registradores de ponteiro e indice

   SP e BP: Segmento de pilha (PUSH e POP);
   
   SI e DI: Segmento de dados;
   
   SS: Segmento de pilha;
   
   CS: Segmento de codigo;
   
   DS e ES: Segmento de dados e segmento extra de dados.
   
   
 ### Endereço de Memória (HEXADECIMAL)
    
   O calculo para fazer essa operação é (os números estão em hexadecimal): 
   
      CS*10+IP
      
### Flags

     
| Estado | Simbolo 1 (Ativo) | Simbolo 0 (Não ativo) |
| --- | --- | --- |
| Carry (CF) | CY (Ativo) | NC (Não ativo)|
| Paridade (PF) | PE (Par) | PO (Impar) |
| Carry Auxiliar (AF) | AC (Carry auxiliar) | NC (Sem carry auxiliar) |
| Zero (ZF) | ZR (Zero) | NZ (Não zero) |
| Sinal (SF) | NG (Negativo) | NC (Positivo) |
| Overflow (OF)| OV (Overflow) | NV (Sem overflow) |
| Direção (DF) | DN (para baixo) | UP (Para cima) |
| Interrupções (IF) | EI (Permitido) | DI (Não permitido) |

### Operações

| Função | Descrição | Exemplo |
| --- | --- | --- |
| MOV | Copia valores | MOV AX, 56|
| ADD | Faz adição sem o carry | ADD AX, 45|
| ADC | Faz adição com carry| ADC AX, 89|
| INC |  Incrementa| INC AX|
| DEC |  Decrementa| DEC AX|
| SUB |  Subtrai valores utilizar sem carry| SUB AX, 2|
| SBB |  Subtrai valores utilizando carry| SBB AX, 3|
| MUL |  Multiplica valores, se for um byte(tipo AL) o resultado fica em AX, se for uma word o resultado fica em DX (parte maior) e AX (parte menor)| MUL CX|
| DIV |  Divide os valores, se for um byte(tipo AL) o resultado fica em AL e resto em AH, se for uma word o resultado fica em DX (parte maior) e AX (parte menor)| DIV CX|
| RCL |  | |
| RCR |  | |
| ROL |  | |
| ROR |  | |
| SHL |  | |
| AND |  | |
| OR |  | |
| NOT |  | |
| XOR |  | |
| PUSH |  | |
| POP |  | |



