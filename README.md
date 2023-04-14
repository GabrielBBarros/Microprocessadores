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


### Como começo?
   
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
| INC |  Incrementa (Não afeta o carry)| INC AX|
| DEC |  Decrementa (Não afeta o carry)| DEC AX|
| SUB |  Subtrai valores utilizar sem carry| SUB AX, 2|
| SBB |  Subtrai valores utilizando carry| SBB AX, 3|
| MUL |  Multiplica valores, se for um byte(tipo AL) o resultado fica em AX, se for uma word o resultado fica em DX (parte maior) e AX (parte menor)| MUL CX|
| DIV |  Divide os valores, se for um byte(tipo AL) o resultado fica em AL e resto em AH, se for uma word como AX o resultado fica em DX (parte maior) e AX (parte menor)| DIV CX|
| RCL | Rotaciona à esquerda utilizando carry, assim, por exemplo, temos que pegar um número em hexa decimal tranformar em binário, depois substituitmos o bit que está na última posição com aa posição que o carry estava, e onde estava o carry ele segue para a primeira posição do nosso "array" de bits | RCL AX, 2|
| RCR | A lógica é a mesma que a do RCL, porém faz o movimento contrário | RCR AX, 1|
| ROL | Rotaciona como os demais à esquerda, porém sem usar o carry, além disso o que estava na última posição também assume o lugar do carry | ROL AX, 1|
| ROR |  Rotaciona como os demais à direita, porém sem usar o carry, além disso o que estava na última posição também assume o lugar do carry| ROL AX, 2|
| SHL | Ele coloca zero na primeira posição do array, e o que estva em último assume o lugar do carry, porém gosto de fazer essa operação apenas multiplicando o número por dois | SHL AX, 2|
| AND |  Faz a operação de AND (lembrando que apenas valores '1' com '1' se obtem resultado 1)| AND AL, 4|
| OR | Faz a operação de OR (Se há '1' independente o outro valor o resultado vai ser '1', se não '0') | OR AL, 0|
| NOT | Faz a operação de negação (Se há '1' o resultado é '0' e vice-versa) | NOT AX|
| XOR |  Faz a operação de XOR (Se valore iguais o resultado é '0', valores diferente o resultado dá '1')| XOR AX,1|
| PUSH | Faz a operação de push na pilha, ou seja uma inserção | PUSH AX|
| POP |  az a operação de pop na pilha, ou seja uma remoção no final| POP AX|


### Endereçamento

   Existe alguns jeitos de endereçamento em Assembly utilizando o DosBox, aqui vai alguns deles:
   
   Endereçamento de valor (imediato)
   
      MOV AX, 100
      
   Endereçamento direto na linha de memória
   
      MOV AX, [104]
      
   Endereçamento entre registros gerais
   
      MOV AX, BX
      
   Endereçamento para outros registros
   
      MOV AX, [ES]
      
   Endereçamento de dois outros tipos de registros
   
      MOV AX, [BX][SI]
      
   Endereçamento indexado
   
      MOV AX,[BX+0001]
      
   Endereçamento por deslocamento
   
      MOV AX, DS:[1000]
  
  
### Complemento de 2

  Para achar o complemento de 2 de um número obte-lo, converter para binário, fazer a operação NOT (inverter números) e somar mais 1. se o último valor for 0 ele é positivo, caso o contrário ele é negativo.
  
      Exemplo: 36 (Hexadecimal) -> 0011 0110 (Binário)-> 1100 1001 -> 1100 1010 -> CA (Hexadecimal)

### String

   Uma String corresponde a um elemento de apartir de 8 sté 16 bits, é possível fazer diversas operações.
   
   Para movimentar uma string grandes podemos entre outros registradores especiais, seja o byte (B) ou a word (W), essa movimentação ocorre de [DS:SI] -> [ES:DI], porem lembre-se que é uma cópia, além que dependendo para paridade pode ser decrementado ou incrementado. Exemplo:
            
       MOVSB
       MOVSW
   
   Para carregar uma string (Endereço de memória -> Registrador)usamos a função LODS, sendo para byte utilizamos o sulfixo 'B' e para uma word o sulfico 'W', como fizemos no MOVS, o nosso "carregamento". Por último lembre-se que SI é incrementado ou decrementado dependendo do flag de de direção (1 para byte e 2 para word).
   
      LODSB
      LODSW
     
  Já para salvarmos uma string o movimento é o inverso (Registrador -> endereço de memória), a lógica do 'b' e do 'w' é a mesma, porém o que é incrementado e decrementado é o DI
  
      STOSB
      STOSW
      
  O comando 'CLD' faz com que os flags de direção fique setado como zero.
  
  Outras funções importantes para os programas em assembly são os laços de repetição. Logo abaixo terá uma tabela no que cada um faz e um exemplo:
  
| Função | Descrição | Exemplo |
| --- | --- | --- |
| REP | Faz o comando de repetição de string longs, enquanto cx != 0 | REP MOVSW |
| JZ | É um comando de jump relativo onde só irá fazer o laço se for resultado for 0 | JZ 100 |
| JNZ | É um comando de jump relativo onde só irá fazer o laço se for resultado for  diferente de 0 | JNZ 100 |
| JC | É um comando que só irá saltar se o houver carry | JC 100 |
| JNZ | É o oposto de J, ou seja se não houver carry | JNZ 100 |
| JB | Mesma coisa do JZ | JB 100 |
| JMP | É um jump incondicional, ou seja, pulará inpenednete da condição | JMP 100 |

### Sub-Rotina

   Uma sub rotina seria como a chamada de uma função, para acessar ela utilizamos o comando CALL (além disso o Call guarda a instrução seguinte na pilha, para mais tarde), e para voltarmos da função usamos o comando RET na subrotina (volatando imediatamente onde aquela instrução subsequente de Call foi guardada). E por último nesse tópico há duas instruçlões interessantes que são a LOOP, que faz um laço utilizando CALL decrementando CX e o XCHG, que troca os valores de dois registradores.
   
    102  CALL 0150
    LOOP 102
    
    ...
    ...
    
    RET
    XCHG AX, BX

          
   
   
