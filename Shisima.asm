; Estrutura
; Jogo Shisima
;main:
; Seta Parametros
; Call Desenha Tabuleiro
; 
;    Loop:
;        Call SelectAndMove
;        Call CheckVictory
;        Call ChangePlayer
;        jmp Loop
;
;    Halt
;
;SelectAndMove:
;    LoopInput:
;        --Pede input para saber qual peça vai ser movida
;        Call getCell
;        --Verificar se é uma peça do jogador atual
;        --se não for jmp LoopInput
;        --Pede input para onde mexer
;        Call getCell
;        --Checa se o movimento é valido
;        Call CheckMove
;        se nao valido jmp LoopInput
;    --Move peças
;    RTS
;
;CheckVictory:
;    --checa celula do meio
;    se não tem peça no centro jmp EndCheck 
;    LoopVictory: ;faz de x=0 a 3 incluso
;        --se x = 4 jmp EndCheck
;        --checa se x é igual ao centro
;        jne Loopnext
;        --checa se x+4=centro
;        jne LoopNext
;        Call VictoryScreen    
;    
;    LoopNext:
;        --incrementa x
;        jmp LoopVictory
;        
;    EndCheck:
;        RTS
;
;ChangePlayer:
;    --seta player que vai jogar
;
;
;CheckMove:
;    
;
;VictoryScreen:
;    --Imprime a tela
;    --se vencedor @
;    Call ImprimeAt
;    jmp VictoryEnd
;    Call ImprimeCerquinha

;********************************************************;
;            TRABALHO ORG COMP -  SHISIMA                ;
;********************************************************;
;  - Luiz Henrique Benedito Belorio, nUSP: 12563814      ;
;  - Murilo Franchi, nUSP: 9790760                       ;
;********************************************************; 


jmp main

pos1: var #1 ; Posicao da peça 1 na tela
pos2: var #1 ; Posicao da peça 2 na tela
pos3: var #1 ; Posicao da peça 3 na tela
pos4: var #1 ; Posicao da peça 4 na tela
pos5: var #1 ; Posicao da peça 5 na tela
pos6: var #1 ; Posicao da peça 6 na tela
pos7: var #1 ; Posicao da peça 7 na tela
pos8: var #1 ; Posicao da peça 8 na tela
pos9: var #1 ; Posicao da peça 9 na tela


peca1: var #1 ; Posicao da peça 1 na tela
peca2: var #1 ; Posicao da peça 2 na tela
peca3: var #1 ; Posicao da peça 3 na tela
peca4: var #1 ; Posicao da peça 4 na tela
peca5: var #1 ; Posicao da peça 5 na tela
peca6: var #1 ; Posicao da peça 6 na tela
peca7: var #1 ; Posicao da peça 7 na tela
peca8: var #1 ; Posicao da peça 8 na tela
peca9: var #1 ; Posicao da peça 9 na tela


jogador: var #1; Simbolo do Jogador atual
vencedor: var #1; Simbolo do Vencedor

msgV: string "Vencedor: "
msgS: string "Selecione uma peca:                    "
msgM: string "Selecione o movimento:                 "
msgN: string "Essa nao eh a sua peca!                "
msgI: string "Movimento Invalido                     "
msgInvalido: string "Caractere Invalido                   "

msg1: string "++++      SHISIMA     ++++              "
LinhaBranco: string "                                       "
msg2: string " SHISIMA e um jogo de dois jogadores    "
msg3: string " originado no Kenya. O objetivo do      "
msg4: string " jogo e conseguir alinhar tres pecas    "
msg5: string " passando pelo centro do tabuleiro.     "
msg6: string " Porem so e possivel mover as pecas     "
msg7: string " sobre as linhas tracadas.              "
msg8: string " Parece um jogo simples, mas e          "
msg9: string " necessario uma boa estrategia.         "
msg10: string "      Pressione qualquer tecla para     "
msg11: string "                INICIAR                 "
LinhaBranco1: string "                                       "
LinhaBranco2: string "                                       "
LinhaBranco3: string "                                       "
LinhaBranco4: string "                                       "
LinhaBranco5: string "                                       "
LinhaBranco6: string "                                       "
LinhaBranco7: string "                                       "
LinhaBranco8: string "                                       "
LinhaBranco9: string "                                       "
LinhaBranco10: string "                                       "
LinhaBranco11: string "                                       "
LinhaBranco12: string "                                       "
LinhaBranco13: string "                                       "
LinhaBranco14: string "                                       "
LinhaBranco15: string "                                       "
LinhaBranco16: string "                                       "
LinhaBranco17: string "                                       "
LinhaBranco18: string "                                       "


;********************************************************;
;                - PROGRAMA PRINCIPAL -                  ;
;********************************************************; 

main:
    ;setando a posição das peças na tela
    loadn r0, #250
    store pos1, r0
    loadn r0, #172
    store pos2, r0
    loadn r0, #254
    store pos3, r0
    loadn r0, #336
    store pos4, r0
    loadn r0, #414
    store pos5, r0
    loadn r0, #492
    store pos6, r0
    loadn r0, #410
    store pos7, r0
    loadn r0, #328
    store pos8, r0
    loadn r0, #332
    store pos9, r0
    
    ;setando peças no tabuleiro
    loadn r0, #'@'
    store peca1, r0
    loadn r0, #'@'
    store peca2, r0
    loadn r0, #'@'
    store peca3, r0
    loadn r0, #'O'
    store peca4, r0
    loadn r0, #'#'
    store peca5, r0
    loadn r0, #'#'
    store peca6, r0
    loadn r0, #'#'
    store peca7, r0
    loadn r0, #'O'
    store peca8, r0
    loadn r0, #'O'
    store peca9, r0
    
    loadn r0, #'!' 
    store vencedor, r0; Guarda o valor do vencedor padrão '!'
    
    loadn r0, #'@'
    store jogador, r0; Guarda o valor do primeiro Jogador
    
    
    call ImprimeStart ; Imprime a tela inicial
    call ImprimeTab
    call imprimePecas
 
    MainLoop:
        ;Chama a função para selecionar e mover uma peça
        Call SelectAndMove
        
        Call CheckVictory2
        ;Verifica se o vencedor é diferente do defaul '!'
        load r0, vencedor
        loadn r1,#'!'
        cmp r0,r1
        jne temVencedor
        
        Call ChangePlayer
        
        jmp MainLoop
    temVencedor:
        Call VictoryScreen    
Halt

;********************************************************;
;              - FIM DO PROGRAMA PRINCIPAL -             ;
;********************************************************;




;********************************************************;
;                - INICIO DAS SUBROTINAS -               ;
;********************************************************;

; Função adaptada de Imprime Tela da Nave11, para imprimir a tela inicial
ImprimeStart: ;  Rotina de Impresao de Cenario na Tela Inteira
        ;  r1 = endereco onde comeca a primeira linha do Cenario
        ;  r2 = cor do Cenario para ser impresso

    push fr        ; Protege o registrador de flags
    push r0    ; protege o r3 na pilha para ser usado na subrotina
    push r1    ; protege o r1 na pilha para preservar seu valor
    push r2    ; protege o r1 na pilha para preservar seu valor
    push r3    ; protege o r3 na pilha para ser usado na subrotina
    push r4    ; protege o r4 na pilha para ser usado na subrotina
    push r5    ; protege o r5 na pilha para ser usado na subrotina

    loadn R1, #msg1
    loadn R2, #0
    loadn R0, #0      ; posicao inicial tem que ser o comeco da tela!
    loadn R3, #40      ; Incremento da posicao da tela!
    loadn R4, #41      ; incremento do ponteiro das linhas da tela
    loadn R5, #1200   ; Limite da tela!
    
   ImprimeTela_Loop:    
        call ImprimeStr
        add r0, r0, r3      ; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
        add r1, r1, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 por causa do /0 !!) --> r1 = r1 + 41
        cmp r0, r5        ; Compara r0 com 1200
        jne ImprimeTela_Loop    ; Enquanto r0 < 1200
    
    loadn r2, #13 ; Caracter do enter
        
    loopmenu: 
        inchar r1 ; Le teclado

        cmp r1,r2
        jeq iniciaJogo ; Se apertou enter, inicia o jogo.    
        jmp loopmenu   ; Se não, fica em loop    

        iniciaJogo:
    pop r5    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr
rts

;Função de imprimir uma string, retirada do código da Nave11
ImprimeStr:    ;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
    push fr        ; Protege o registrador de flags
    push r0    ; protege o r0 na pilha para preservar seu valor
    push r1    ; protege o r1 na pilha para preservar seu valor
    push r2    ; protege o r1 na pilha para preservar seu valor
    push r3    ; protege o r3 na pilha para ser usado na subrotina
    push r4    ; protege o r4 na pilha para ser usado na subrotina
    
    loadn r3, #'\0'    ; Criterio de parada

   ImprimeStr_Loop:    
        loadi r4, r1
        cmp r4, r3
        jeq ImprimeStr_Sai
        add r4, r2, r4
        outchar r4, r0
        inc r0
        inc r1
        jmp ImprimeStr_Loop
    
   ImprimeStr_Sai:    
    pop r4    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr
rts



;Função para imprimir a tabela do jogo na tela, adaptada da função da Nave11
ImprimeTab: ;  Rotina de Impresao de Cenario na Tela Inteira
        ;  r1 = endereco onde comeca a primeira linha do Cenario
        ;  r2 = cor do Cenario para ser impresso

    push fr        ; Protege o registrador de flags
    push r0    ; protege o r3 na pilha para ser usado na subrotina
    push r1    ; protege o r1 na pilha para preservar seu valor
    push r2    ; protege o r1 na pilha para preservar seu valor
    push r3    ; protege o r3 na pilha para ser usado na subrotina
    push r4    ; protege o r4 na pilha para ser usado na subrotina
    push r5    ; protege o r4 na pilha para ser usado na subrotina

    loadn R1, #LinhaTab01
    loadn R2, #0
    loadn R0, #0      ; posicao inicial tem que ser o comeco da tela!
    loadn R3, #40      ; Incremento da posicao da tela!
    loadn R4, #41      ; incremento do ponteiro das linhas da tela
    loadn R5, #1200   ; Limite da tela!
    
   ImprimeTab_Loop:
        call ImprimeStr
        add r0, r0, r3      ; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
        add r1, r1, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
        cmp r0, r5        ; Compara r0 com 1200
        jne ImprimeTab_Loop    ; Enquanto r0 < 1200
    
    
    ;imprime o jogador inicial
    load R3, jogador
    loadn R4, #35
    outchar R3, r4
    
        pop r5    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
        pop r4
        pop r3
        pop r2
        pop r1
        pop r0
        pop fr
rts


;imprime as pecas em suas respectivas posicoes.
imprimePecas:
    push fr        ; Protege o registrador de flags
    push r0    ; protege o r0 na pilha para preservar seu valor
    push r1    ; protege o r1 na pilha para preservar seu valor
    
    load r1,peca1
    load r0,pos1
    outchar r1,r0
    
    load r1,peca2
    load r0,pos2
    outchar r1,r0
    
    load r1,peca3
    load r0,pos3
    outchar r1,r0
    
    load r1,peca4
    load r0,pos4
    outchar r1,r0
    
    load r1,peca5
    load r0,pos5
    outchar r1,r0
    
    load r1,peca6
    load r0,pos6
    outchar r1,r0
    
    load r1,peca7
    load r0,pos7
    outchar r1,r0
    
    load r1,peca8
    load r0,pos8
    outchar r1,r0
    
    load r1,peca9
    load r0,pos9
    outchar r1,r0
    
    
    pop r1
    pop r0
    pop fr
rts

;Troca o jogador atual
ChangePlayer:;r0 jogador atual, 
    push fr    ; Protege o registrador de flags
    push r0    ; protege o r0 na pilha para ser usado na subrotina
    push r1    ; protege o r1 na pilha para preservar seu valor
    push r2    ; protege o r2 na pilha para preservar seu valor
    push r3    ; protege o r3 na pilha para ser usado na subrotina
    push r4    ; protege o r4 na pilha para ser usado na subrotina
    
    
    loadn R4, #35 ; local na Tela do Jogador
    
    load r0,jogador ;carrega jogador atual no r0
    loadn r1,#'@'; primeiro jogador para ser comparado
    cmp r1,r0
    jne jog2 ;se não for o jogador 1, pula para o jogador 2
     
    ;Antigo Jogador era @ agora sera #
    loadn r3,#'#' ; Novo jogador
    outchar R3, r4
    
    store jogador, r3;
    jmp changePlayerEnd ;vai pro fim
    
    jog2: ;Antigo Jogador era #, agora sera @
    loadn r3,#'@' ; Novo jogador
    outchar R3, r4
    
    store jogador, r3;
    changePlayerEnd:
    pop r4    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr
    rts


;Checa se existe uma condição vitoriosa no tabuleiro
CheckVictory2:; r0 peça do centro, r1 peça que esta sendo comparada


    push fr        ; Protege o registrador de flags
    push r0    ; protege o r0 na pilha para ser usado na subrotina
    push r1    ; protege o r1 na pilha para preservar seu valor

    ;A condicao de vitoria implica que tem uma peca nao vazia no centro do tabuleiro
    ;Carregamos a peca do centro e comparamos com uma casa vazia
    loadn r1,#'O'
    load r0, peca9
    cmp r0,r1
    jeq noVictory ; Se for igual, nao ha vencedores
    
    ;Primeiro conjunto de teste, as posições 1 e 5 devem ter o mesmo caractere par aser vencedor
    ;Carrega peça1
    load r1, peca1
    cmp r0,r1       ;compar a peça 1 com o centro
    jne set2        ;se não for igual, pula para o proximo conjunto de teste
    load r1, peca5  ;se for igual continua e carrega a peça 5
    cmp r0,r1       ;compara com o centro
    jeq victory     ;se for igual, existe um vencedor
    
    
    
    ;Segudo conjunto de teste, idem ao set1, mas com as peças 2 e 6
    set2:
    load r1, peca2
    cmp r0,r1
    jne set3
    load r1, peca6
    cmp r0,r1
    jeq victory
    
    ;terceiro conjunto de teste, idem ao set1, mas com as peças 3 e 7
    set3:
    load r1, peca3
    cmp r0,r1
    jne set4
    load r1, peca7
    cmp r0,r1
    jeq victory
    
    ;quarto conjunto de teste, semelhate ao set1, mas se a peça 4 ou 8 for diferente do centro, não ha vencedores ainda
    set4:
    load r1, peca4
    cmp r0,r1
    jne noVictory
    load r1, peca8
    cmp r0,r1
    jeq victory
    jmp noVictory
    
    ;em uma vitoria, carrega a peça central do jogador vitorioso na memoria
    victory:
    store vencedor, r0;

    ;se não ouver vitorio só retorna
    noVictory:
    pop r1
    pop r0
    pop fr
rts


VictoryScreen:
         ;  Rotina de Impresao da tela de vitoria

    push fr        ; Protege o registrador de flags
    push r0    ; protege o r0 na pilha para ser usado na subrotina
    push r1    ; protege o r1 na pilha para preservar seu valor
    push r2    ; protege o r2 na pilha para preservar seu valor
    push r3    ; protege o r3 na pilha para ser usado na subrotina
    push r4    ; protege o r4 na pilha para ser usado na subrotina
    push r5    ; protege o r5 na pilha para ser usado na subrotina
    push r6    ; protege o r5 na pilha para ser usado na subrotina
    push r7    ; protege o r5 na pilha para ser usado na subrotina
    
    loadn R1, #linhaVic00   ; Primeira linha da Tela
    loadn R2, #0            ; cor
    loadn R0, #640          ; posicao inicial, segunda metade da tela
    loadn R3, #40      ; Incremento da posicao da tela!
    loadn R4, #41      ; incremento do ponteiro das linhas da tela
    loadn R5, #960   ; fim da mensagemd e vitoria
    
    
   ImprimeVitoria_Loop:    
        call ImprimeStr
        add r0, r0, r3      ; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
        add r1, r1, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 por causa do /0 !!) --> r1 = r1 + 41
        cmp r0, r5        ; Compara r0 com 1200
        jne ImprimeVitoria_Loop    ; Enquanto r0 < 1200
    
    
    ;verifica o vencedor e imprime respectiva ASCII art
    loadn r6, #'#'
    load r7, vencedor
    cmp r6, r7
    jeq VencedorCerquinha
    loadn r1, #arrobinhaLin01
    jmp VencedorImprime
    
    VencedorCerquinha:
        loadn r1, #cerquinhaLin01
    VencedorImprime:
        call ImprimeVencedor    
        
    loadn r2, #13 ; Caracter do enter
        
    loopVic: 
        inchar r1 ; Le teclado
        cmp r1,r2
        jeq iniciaJogo ; Se apertou enter, inicia o jogo.    
        jmp loopVic   ; Se não, fica em loop    

    pop r7
    pop r6
    pop r5    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr
rts

ImprimeVencedor:; recebe qual de vencedor sera impresso
        ;  Rotina de Impresao de Cenario na Tela Inteira
        ;  r1 = endereco onde comeca a primeira linha do Cenario
        ;  r2 = cor do Cenario para ser impresso

    push fr        ; Protege o registrador de flags
    push r0    ; protege o r0 na pilha para ser usado na subrotina
    push r2    ; protege o r2 na pilha para preservar seu valor
    push r3    ; protege o r3 na pilha para ser usado na subrotina
    push r4    ; protege o r4 na pilha para ser usado na subrotina
    push r5    ; protege o r4 na pilha para ser usado na subrotina

    loadn R2, #0
    loadn R0, #960      ; posicao inicial tem que ser o comeco da tela!
    loadn R3, #40      ; Incremento da posicao da tela!
    loadn R4, #41      ; incremento do ponteiro das linhas da tela
    loadn R5, #1200   ; Limite da tela!
    
   ImprimeVencedor_Loop:    
        call ImprimeStr
        add r0, r0, r3      ; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
        add r1, r1, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 por causa do /0 !!) --> r1 = r1 + 41
        cmp r0, r5        ; Compara r0 com 1200
        jne ImprimeVencedor_Loop    ; Enquanto r0 < 1200
    
    
  
    pop r5    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r4
    pop r3
    pop r2
    pop r0
    pop fr
rts

;Recebe um caractere do teclado, adaptado do código de forca e retorna no r0
RecebeChar:
	push r1
	loadn r1, #255
	RecebeCharLoop:
	    inchar r0 ; o Inchar devolve 255 se nenhuma tecla esta sendo precionada, então ao esperar uma tecla, ele fica testando até alguem apertar algo
	    cmp r0, r1
	    jeq RecebeCharLoop
	pop r1
rts

;Recebe um caractere e verifica se ele é valido (entre 1 e 9)
Select: ;seleciona a peça e verifica se ela é 
    push fr
    push r1
    push r2
    push r5
    push r6
    push r7

    ;carrega os caracteres '1' e '9'
    loadn r6,#'1'
    loadn r5,#'9'
    
    selectLoop:
        ;recebe um char e move para o r7 (para se precisar imprimir uma msg
        call RecebeChar;
        mov r7, r0
        cmp r7, r6
        jle caractereInvalido   ; Se for menor que '1' não é um caractere valido
        cmp r7, r5
        jgr caractereInvalido   ; Se for maior que '9' também não é valido
        
        ; imprime limpa a linha caso tenha msg de erro
        loadn r0, #720
        loadn r1, #LinhaBranco
        loadn r2, #0
        call ImprimeStr
        jmp selectEnd
        
    ; imprime msg de erro e tenta receber novo caractere
    caractereInvalido:
        loadn r0, #720
        loadn r1, #msgInvalido
        loadn r2, #0
        call ImprimeStr
        jmp selectLoop
    
    
    selectEnd:
    mov r0, r7
    pop r7
    pop r6
    pop r5    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r2
    pop r1
    pop fr
rts


;Seleciona Peça e Move ela
SelectAndMove:;r7: endereco da peça que foi movida, r6 endereço da peça para onde sera movida, r5 offset da peça, r4 jogador atual
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7
    
        ; carrega jogador atual
        load r4, jogador
    selectMLoop:
        loadn r0, #640
        loadn r1, #msgS
        loadn r2, #0
        call ImprimeStr; Imprime msg na tela
        call Select; retorna no r0 o caractere que quer mover
        ;imprimindo peça que sera movida
        loadn r2, #662
        outchar r0, r2
        
        
        loadn r1,#'1'
        sub r5,r0,r1; r5=r0-r1  ; Subtrai o caractere '1' do caractere recebido no select
        loadn r7, #peca1        ; carrega Endereço da peça 1
        add r7,r7,r5; soma o offset da peca  a ser mexida no endereço da peca1, r7 = r7+r5
        loadi r3,r7; carrega valor da peca ser mexida r3 = MEM[r7]
        cmp r3,r4 ; compara para ver se é a peça do jogador atual
        jeq move ; se for jump para tentar mover
        loadn r0, #720
        loadn r1, #msgN; Imprime msg que  tentou mexer uma peça que não é sua
        loadn r2, #0
        call ImprimeStr
        jmp selectMLoop ; loop para mexer outra peça
        
        
    move:
        loadn r0, #680
        loadn r1, #msgM
        loadn r2, #0
        call ImprimeStr ; imprime msg de movimento

        loadn r1,#'1'        
        call Select
        loadn r2, #702
        outchar r0, r2 ; imprime para onde tentara ser movido
        
        sub r3,r0,r1; r3-> offset do local para onde sera mexido
        cmp r3,r5 ; compara os offsets só para ter certeza que não vai tentar "mexer para o mesmo lugar"
        jne moveCase1
        localInvalido:
            loadn r0, #720
            loadn r1, #msgI
            loadn r2, #0
            call ImprimeStr
            jmp selectMLoop
            
            ;verifica se esta movendo a peça 1 e se a posição para onde vai mexer é adjacente a 1 (posições 2 e 8, a 9 é comum a todas, é tratada separadamente
        moveCase1:
            loadn r1, #0
            cmp r5, r1
            jne moveCase2
            loadn r1, #7
            cmp r3, r1
            jeq moveValido
            loadn r1, #1
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
        
        moveCase2: ;idem case1
            loadn r1, #1
            cmp r5, r1
            jne moveCase3
            loadn r1, #0
            cmp r3, r1
            jeq moveValido
            loadn r1, #2
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
            
        moveCase3:
            loadn r1, #2
            cmp r5, r1
            jne moveCase4
            loadn r1, #1
            cmp r3, r1
            jeq moveValido
            loadn r1, #3
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
        
        moveCase4:
            loadn r1, #3
            cmp r5, r1
            jne moveCase5
            loadn r1, #2
            cmp r3, r1
            jeq moveValido
            loadn r1, #4
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
        
        moveCase5:
            loadn r1, #4
            cmp r5, r1
            jne moveCase6
            loadn r1, #3
            cmp r3, r1
            jeq moveValido
            loadn r1, #5
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
        
        moveCase6:
            loadn r1, #5
            cmp r5, r1
            jne moveCase7
            loadn r1, #4
            cmp r3, r1
            jeq moveValido
            loadn r1, #6
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
        
        moveCase7:
            loadn r1, #6
            cmp r5, r1
            jne moveCase8
            loadn r1, #5
            cmp r3, r1
            jeq moveValido
            loadn r1, #7
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
        
        moveCase8:
            loadn r1, #7
            cmp r5, r1
            jne moveValido
            loadn r1, #6
            cmp r3, r1
            jeq moveValido
            loadn r1, #0
            cmp r3, r1
            jeq moveValido
            jmp moveSwitchFim
        
        moveSwitchFim: ;se não for verifica se esta tentando mover para o local 9, onde todos os movimentos são validos
            loadn r1, #8
            cmp r3, r1
            
            jeq moveValido
            jmp localInvalido ; se não for nenhum dos casos o movimento é invalido
        
        
        
        
    moveValido:
        ;verifica se o local para onde esta tentando mover esta livre
        loadn r6,#peca1
        add r6, r6, r3;
        loadn r3, #'O'
        
        loadi r1, r6
        cmp r1,r3
        jne localInvalido; se não for 'O' não é valido
        
        ;coloca 'O' na peça que foi mexida
        storei r7, r3
        load r3, jogador ;e o jogador atual para onde foi mexida
        storei r6,r3
        call imprimePecas ;reimprime as peças. Poderia ter só trocado colocado para imprimir as peças que mudaram, mas a função estava pronta :v
        
        ;limpa a tela de baixo das mensagens
        loadn r0, #640
        loadn r1, #LinhaBranco
        loadn r2, #0
        call ImprimeStr
        loadn r0, #680
        call ImprimeStr
        loadn r0, #720
        call ImprimeStr

    pop r7
    pop r6
    pop r5    ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr
rts

;********************************************************;
;                 - FIM DAS SUBROTINAS -                 ; 
;********************************************************;



;********************************************************;
;                  - TELAS DO PROGRAMA -                 ;
;********************************************************;

LinhaTab01: string "Shisima                   Jogador:      "
LinhaTab02: string "                                        "
LinhaTab03: string "                                        "
LinhaTab04: string "            2                           "
LinhaTab05: string "                                        ";160
LinhaTab06: string "         1 /|\\ 3                        "
LinhaTab07: string "            |                           "
LinhaTab08: string "         / \\|/ \\                        "
LinhaTab09: string "      8  --- ---  4                     "
LinhaTab10: string "         \\ /|\\ /                        "
LinhaTab11: string "            |                           "
LinhaTab12: string "         7 \\|/ 5                        "
LinhaTab13: string "                                        "
LinhaTab14: string "            6                           "
LinhaTab15: string "                                        "
LinhaTab16: string "----------------------------------------"
LinhaTab17: string "                                        "
LinhaTab18: string "                                        "
LinhaTab19: string "                                        "
LinhaTab20: string "                                        "
LinhaTab21: string "                                        "
LinhaTab22: string "                                        "
LinhaTab23: string "                                        "
LinhaTab24: string "                                        "
LinhaTab25: string "                                        "
LinhaTab26: string "                                        "
LinhaTab27: string "                                        "
LinhaTab28: string "                                        "
LinhaTab29: string "                                        "
LinhaTab30: string "                                        "

linhaVic00: string "                                        "
linhaVic01: string " \\ \\    / (_)    | |                   "
linhaVic02: string "   \\ \\  / / _  ___| |_ ___  _ __ _   _  "
linhaVic03: string "    \\ \\/ / | |/ __| __/ _ \\| '__| | | | "
linhaVic04: string "     \\  /  | | (__| || (_) | |  | |_| | "
linhaVic05: string "      \\/   |_|\\___|\\__\\___/|_|   \\__, | "
linhaVic06: string "                                  __/ | "
linhaVic07: string "                                 |___/  "

cerquinhaLin01: string "                  _  _                  "  
cerquinhaLin02: string "                _| || |_                "
cerquinhaLin03: string "               |_  __  _|               "
cerquinhaLin04: string "                _| || |_                "
cerquinhaLin05: string "               |_  __  _|               "
cerquinhaLin06: string "                 |_||_|                 "
                
arrobinhaLin01: string "                   ____                 "
arrobinhaLin02: string "                  / __ \\                " 
arrobinhaLin03: string "                 / / _` |               "         
arrobinhaLin04: string "                 | |(_| |              "
arrobinhaLin05: string "                  \\ \\__,_|              "
arrobinhaLin06: string "                   \\____/              " 
          
