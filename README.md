# Microprocessadores
Alguns arquivos de exercicios e teoria de microprocessadores


# Teoria


## Entendimento básico e operações


### Processadores e plataforma

   Nesa parte trabalharemos com processadores da Intel 8088 e 8086, a grande diferença de um e outro se encontra no seu barramente (onde se manioula os dados), onde o 8088 possui apenas dois barramentos de 8 bits e o 8086 possui um de 16 bits, nesse caso o 8086 precisa apenas de uma operação para manipular dados de 16 bits, enquanto o 8088 precisa de duas. Aqui utilizaremos a plataforma DosBox para fazer os nossos códigos.
   
## Arquitetura RISC X CISC
   
   A arquitetura do tipo CISC tem a caracterisitca de duas instruções serem mais complexas. Já as RISC possui instruções mais simples e eleas são mais eficientes eme energia e velocidade.
  
##Endereço Físico

   Para calcular o endereço físico precisamos saber de duas coisas, a primeira delas é que estamos sempre mexendo com o IP e dependendo do exercício com CS ou outro comando que é dado, geralmente usamos CS se queremos calcular o endereço físico da próxima instrução. A formulá se dá como:
   
         CS *10 + IP
         
  Lembrando que todos esses números são do conjunto hexadecimal.
   
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
   
   Para facilitar escreve apenas assim nos primeiros comando do debug.
        
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

'Há uma notação importante para se lembrar para se usar mais tarde, para 8 bits os valores de complemento de 2 serão entre -128 até 127 e para 32 bits de -32768 até 32767'

### Overflow vs Carry

   Uma dúvida frequente é a diferença se após uma operação o valor gerado virá com carry ou overflow caso houver algum tipo de estouro, ou algo do gênero. 
   O overflow ocorre quando há uma quebra do valor por ser um valor maior que o esperado no registrador, essa sinalização pode ser vista quando em 8 bits sem ser sinalizada o valor passar entre 0 a 255, e em 16 bits de 0 a 65535, além disso podemos ver isso em complemento de 2, como mencionado no tópico acima. 
   
   Para sabermos se há overflow usamos dois flags: CF e OF. Para sabermos se houve carry é fácil, basta ver se ultrapassa o limite não sinalizado, já para ver se houve houverflow é necessário converter o resultado da soma em binário para o decimal de complemento de 2, assim se ultrapassar da faixa, isso quer dizer que houve overflow.

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
| REPE e REPZ | Além de fazer o que o REP faz ele vê se o Carry e o Overflow recebem 0 para encerrar, através das operções SCAS (Compara AX ou AL com o que está em ES:DI) oi CMPS (compara strings através de char, alterandos as flags) | REP MOVSW |
| REPNE (Dica: pense que esse 'E' e de equivalente) e REPNZ |  | REP MOVSW |
| JZ | É um comando de jump relativo onde só irá fazer o laço se for resultado for 0 | JZ 100 |
| JNZ | É um comando de jump relativo onde só irá fazer o laço se for resultado for  diferente de 0 | JNZ 100 |
| JC | É um comando que só irá saltar se o houver carry | JC 100 |
| JNC | É o oposto de J, ou seja se não houver carry | JNZ 100 |
| JB | Mesma coisa do JZ | JB 100 |
| JMP | É um jump incondicional, ou seja, pulará inpenednete da condição | JMP 100 |

Existem também alguns saltos utilizando comparações, especialmente essas abaixo ocorrem quando temos números com sinal

| Função | Descrição | Exemplo |
| --- | --- | --- |
| JG | Se for maior | JG 120 |
| JL | Se for menor | JL 120 |
| JNG | Salta se não maior | JNG 120 |
| JGE | Salta se maior u igual| JGE 120 |
| JNLE | Saltar se não menor ou igual (com sinal) | JNLE 120 |
| JNA | Salta se não maior | JNA 120 |
| JAE | Salta se maior ou igual | JAE 120 |
| JNBE | Salta se não for menor ou igual (sem sinal) | JNBE 120 |

### Sub-Rotina

   Uma sub rotina seria como a chamada de uma função, para acessar ela utilizamos o comando CALL (além disso o Call guarda a instrução seguinte na pilha, para mais tarde), e para voltarmos da função usamos o comando RET na subrotina (volatando imediatamente onde aquela instrução subsequente de Call foi guardada). Além desses há duas instruçlões interessantes que são a LOOP, que faz um laço utilizando CALL decrementando CX e o XCHG, que troca os valores de dois registradores.
   
    102  CALL 0150
    LOOP 102
    
    ...
    ...
    
    RET
    XCHG AX, BX

    
   Vale lembrar que o LOOP possui masi duas ramificações o LOOPE/LOOPZ que faz a mesma coisa que o LOOP normal porém vendo se há resultado 0 e CX igual a 0 para parar. Além desse existe o LOOPNE e o LOOPNZ que faz a mesma coisa que o LOOPE porém se houver não houver zero ele para.
    
    LOOPE 120
    LOOPNE 150
    
   CMPS
    
   Os comandos CMPS (B/W) servem para comparar strings char a char e altera a sua flag, decrementando SI e DI, caso ocorrer sucesso na comparação (se realmente forem iguais) retornará flag de zero igual a 1 e o flag de carry igual a 0.
   
      CMPSW
    
   SCASB
    
   Já o comando SCAS (B/W) compara o valor setado em AX ou AL com o endereço ES:DI, subtraindo AX com o valor indicado nesse endereço de memória e fazendo a operação +/-2 em DI, caso haja sucesso na comparação o valor da flag zero será 1, ou seja, há zero.
   
      SCASB
    
   CMP
   
   Faz a comparação de dois registradores, se foram iguais o flag de zero receberá 1, se o primeiro for maior que o segundo o Carry receberá 1, e por último se o primeiro for menor que o segundo o Carry receberá 0.
   
      CMP AX, BX
   
   NEG
   
   Serve para negar um valor, ou seja, invertendo o valor
   
      NEG AX
   
   TEST
   
   Faz um AND entre os valores, porém não guarda o resuldo
   
      TEST AX, BX
   
   
### Interrupções
   
   As interrupções nada mais são do que eventos que interrompe o processo natural da máquina, existe vários tipos de interrupções, são elas:
   
| Função | Descrição |
| --- | --- |
| INT 20 | Termina o programa |
| INT 21 | Chama diversas funções |
| INT 25 | Leitura de disco |
| INT 26 | Escrita de disco |
| INT 27 | Termina o programa e mantem residente |
| INT 28 | Aguarda caractere |


### Segmento ou deslocamento?

   Em teoria, o segmento serve como uma parte do endereço físico que serve como ponteiro para uma região da memória, já o deslocamento, é um tipo de distancia entre o início da região da memória apontada pelo segmento até o endereço desejado. Num exercício quando executamos o comando INT 5, por exemplo devemos percorrer a tabela dada em quatro em quatro (lembrando que cada "céçula é composto por um par de números). Vamos supor que você chegou no seguinte estado, por exemplo: 
   
      -> estado inicial = AB 00 98 00
      -> segundo passo = 00 98 00 AB
   
 Basicamente você inverterá mas sem inverter o par.
   
  
  
 ## FPU
   A FPU surgiu pr conta da necessidade de clacular ponto flutuante, uma vez que processadores da familia 8086/8088 apenas trabalhavam com o conjunto dos numeros inteiros, FPU é um coprocessador mais rápido que o processador para esse requisito. A representação de ponto flutuante foi padronizada pelo padrão IEEE-754 (1 bit de sinal, x bits para expoente e y bits para o digito de valor).
   A FPU trabalha com pilha, por isso é importante estudar essa estrutura de dados antes de adentrar dentro desse processo de ponto flutuante, mas basicamente um pilha é uma ED que segue o padrão FILO (First in last Out), um exemplo de pilha é a pilha de ivros, onde nós colocamos um em cima do outro, se quiremos tirar o primeiro livro empilhado, temos que retirar todos os outros antes.
   
### Operações 

| Função | Descrição |
| --- | --- |
| fabs | módulo do topo da pilha |
| fadd | Soma dos dois primeiro elementos do topo, armazenando em um só 'bloco' "(y+x)"|
| fadd st(2), st| Soma o elemento 2 da pilha com o topo, colocando o resultado onnde estava o elemento 2 |
| fadd st(2) | Soma o segundo elemento com o topo, armazenando no topo |
| fadd x | Soma x ao topo |
| fchs | Troca sinal do topo |
| fsub | Subtração |
| fdiv | Divisão |
| fmul | Multiplicação |
| divr | Divisão invertida (x/y) |
| subr | Subtração invertida (x-y) |
| subp | Remove o topo após a operação |
| fld 1 | Carrega 1 |
| fldpi | Carrega pi |
| fldz | Carrega 0 |
| fld st | Copia o topo no topo |
| fld st(2) | Copia st(2) no topo |
| fld x| Copia x no topo |
| fsin | Calcula seno |
| fcos | Calcula cosseno |
| fsincos | Calcula senno-cosseno |
| fxch | Alterna os dois valores do topo |
| fxch st(2) | Alterna os dois valores em especifico e o topo |
| fsqrt | Calcula raiz quadrada |
| fst | Salva topo |
| fstp | Salva o topo e depois remove |
| fyl2x | faz st(1)*log2(st) |
| f2xm1| 2^st  - 1|


### Operações de comparação e salto

| Função | Descrição |
| --- | --- |
| fcom | compara st com st(1) |
| fcom st(2) | compara st com st(2) |
| fcom x| compara st com x |
| ftst| compara o topo com 0|
| ftst| compara o topo com 0|
| ja | Salta se st>st(1) ou st>0|
| jb | Salta se st<st(1) ou st<0|
| je | Salta se st>st(1) ou st=0|


 ### SIMD
  
   É uma extensão do HTML, faz com que os programas executem uma operação em multiplos pedaçoes em paralelo, apenas podem ser executadas com a extensão SSE, ela pode trabalhar com ponto flutuante e inteiros além de trabalhar com oito registradores com 128 bits cada (xmm0 - xmm7).

         
| Função | Descrição | Sulfixo
| --- | --- | --- |
| Acumuladas |Operação em todos os quatro blocos, salvo na primeira linha de blocos | PS |
| Escalares |Operação apenas em um bloco, o restante fica como estava antes, sem alteração | SS |
