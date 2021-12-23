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
;GetCell:
;    --le o teclado até que um numero seja digitado
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

jmp main

pos1: var #0 ; Posicao da peça 1 na tela
pos2: var #0 ; Posicao da peça 2 na tela
pos3: var #0 ; Posicao da peça 3 na tela
pos4: var #0 ; Posicao da peça 4 na tela
pos5: var #0 ; Posicao da peça 5 na tela
pos6: var #0 ; Posicao da peça 6 na tela
pos7: var #0 ; Posicao da peça 7 na tela
pos8: var #0 ; Posicao da peça 8 na tela
pos9: var #0 ; Posicao da peça 9 na tela

cell: var #'0' ; celula utilizada

peca: var #'0' ; posicao da peca que sera movida
pos: var #'0' ; posicao para onde a peca sera movida

jogador: var #'@'; Simbolo do Jogador atual
vencedor: var #'!'; Simbolo do Vencedor

msg1: string "++++      SHISIMA     ++++              "
LinhaBranco: string "                                        "
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


;Inicio do Programa Principal
main:
    call ImprimeStart
    call ImprimeTab
    Loop:
        Call SelectAndMove
        Call CheckVictory
        Call ChangePlayer
        jmp Loop
    Halt
; Fim do programa principal

; Inicio das Subrotinas
;
;


ImprimeStart: ;  Rotina de Impresao de Cenario na Tela Inteira
        ;  r1 = endereco onde comeca a primeira linha do Cenario
        ;  r2 = cor do Cenario para ser impresso

    push fr        ; Protege o registrador de flags
    push r0    ; protege o r3 na pilha para ser usado na subrotina
    push r1    ; protege o r1 na pilha para preservar seu valor
    push r2    ; protege o r1 na pilha para preservar seu valor
    push r3    ; protege o r3 na pilha para ser usado na subrotina
    push r4    ; protege o r4 na pilha para ser usado na subrotina
    push r5    ; protege o r4 na pilha para ser usado na subrotina

    loadn R1, #msg1
    loadn R2, #0
    loadn R0, #0      ; posicao inicial tem que ser o comeco da tela!
    loadn R3, #40      ; Incremento da posicao da tela!
    loadn R4, #41      ; incremento do ponteiro das linhas da tela
    loadn R5, #520   ; Limite da tela!
    
   ImprimeTela_Loop:    
        call ImprimeStr
        add r0, r0, r3      ; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
        add r1, r1, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
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
    
   ImprimeTela_Loop:
        call ImprimeStr
        add r0, r0, r3      ; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
        add r1, r1, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
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


















LinhaTab01: string "Shisima                   Jogador:      "
LinhaTab02: string "                                        "
LinhaTab03: string "                                        "
LinhaTab04: string "            2                           "
LinhaTab05: string "            @                           "
LinhaTab06: string "         1 /|\\ 3                        "
LinhaTab07: string "          @ | @                         "
LinhaTab08: string "         / \\|/ \\                        "
LinhaTab09: string "      8 O---O---O 4                     "
LinhaTab10: string "         \\ /|\\ /                        "
LinhaTab11: string "          # | #                         "
LinhaTab12: string "         7 \\|/ 5                        "
LinhaTab13: string "            #                           "
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



