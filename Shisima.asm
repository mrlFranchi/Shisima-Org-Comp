; Estrutura
; Jogo Shisima
;main:
; Seta Parametros
; Call Desenha Tabuleiro
; 
;	Loop:
;		Call SelectAndMove
;		Call CheckVictory
;		Call ChangePlayer
;		jmp Loop
;
;	Halt
;
;SelectAndMove:
;	LoopInput:
;		--Pede input para saber qual peça vai ser movida
;		Call getCell
;		--Verificar se é uma peça do jogador atual
;		--se não for jmp LoopInput
;		--Pede input para onde mexer
;		Call getCell
;		--Checa se o movimento é valido
;		Call CheckMove
;		se nao valido jmp LoopInput
;	--Move peças
;	RTS
;
;CheckVictory:
;	--checa celula do meio
;	se não tem peça no centro jmp EndCheck 
;	LoopVictory: ;faz de x=0 a 3 incluso
;		--se x = 4 jmp EndCheck
;		--checa se x é igual ao centro
;		jne Loopnext
;		--checa se x+4=centro
;		jne LoopNext
;		Call VictoryScreen	
;	
;	LoopNext:
;		--incrementa x
;		jmp LoopVictory
;		
;	EndCheck:
;		RTS
;
;ChangePlayer:
;	--seta player que vai jogar
;
;GetCell:
;	--le o teclado até que um numero seja digitado
;
;
;CheckMove:
;	
;
;VictoryScreen:
;	--Imprime a tela
;	--se vencedor @
;	Call ImprimeAt
;	jmp VictoryEnd
;	Call ImprimeCerquinha

jmp main

pos1: var # ; Posicao da peça 1 na tela
pos2: var # ; Posicao da peça 2 na tela
pos3: var # ; Posicao da peça 3 na tela
pos4: var # ; Posicao da peça 4 na tela
pos5: var # ; Posicao da peça 5 na tela
pos6: var # ; Posicao da peça 6 na tela
pos7: var # ; Posicao da peça 7 na tela
pos8: var # ; Posicao da peça 8 na tela
pos9: var # ; Posicao da peça 9 na tela

cell: var #'0' ; celula utilizada

peca: var #'0' ; posicao da peca que sera movida
pos: var #'0' ; poscao para onde a peca sera movida

jogador: var #'@'; Simbolo do Jogador atual
vencedor: var #''; Simbolo do Vencedor

msg1: "          SHISIMA                       "
LinhaBranco: "                                        "
msg2: " SHISIMA e um jogo de dois jogadores    "
msg3: " originado no Kenya. O objetivo do      "
msg4: " jogo e conseguir alinhar tres peças    "
msg5: " passando pelo centro do tabuleiro.     "
msg6: " Porem so e possivel mover as pecas     "
msg7: " sobre as linhas tracadas.              "
msg8: " Parece um jogo simples, mas e          "
msg9: " necessario uma boa estrategia.         "


;Inicio do Programa Principal
main:
	;Desenha Tabuleiro
	

	Halt
; Fim do programa principal

; Inicio das Subrotinas
;
;
;
;  Rotina de Impresao de Cenario na Tela Inteira, Feito em Nave11.asm utilizada na aula
ImprimeTela2:
	;  r1 = endereco onde comeca a primeira linha do Cenario
	;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r0 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r2 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts






