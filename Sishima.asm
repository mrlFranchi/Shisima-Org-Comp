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

















