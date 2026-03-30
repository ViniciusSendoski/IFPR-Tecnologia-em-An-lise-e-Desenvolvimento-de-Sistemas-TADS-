exponencial:
    ; criar stack-frame
    push rbp
    mov rbp, rsp

    movss xmm1, xmm0 ; adicionar o valor original
    cmp edi, 0     ; valor é positivo!
    
    jge lacoExpPos

    ; o seguite tava fazendo e nem li o documento, ignora ta errado tipo 2.200000 ^ -2.000000 = 0.093914, vai ficar ai mesmo foi 1h pra essa tristeza
    neg edi  ; modulo de negativo é positivo ;; expoente negativo -_-
    lacoExpNeg: ; expoente negativo
        cmp edi, 1
        je calculoNeg
        multiplicaPExpNeg:
            mulss xmm1, xmm0 ; xmm1 como temporario para multiplicação
        dec edi
        jmp lacoExpNeg
    calculoNeg:
        divss xmm2, xmm1 ; 1 dividido pelo expoente absoluto
        l0:
        movss xmm1, xmm2 ; retorna para o temporario   
        jmp calculado
    ; fim, ta agora são 2h depois que e funciona, tava multiplcando errado, 1vez a mais

    lacoExpPos: ; expoente positivo
        cmp edi, 1
        je calculado

        multiplicaPExponencial:
            mulss xmm1, xmm0 ; xmm1 como temporario para multiplicação
        dec edi
        jmp lacoExpPos

    calculado:
        movss xmm0, xmm1 ; move do temporario para saida de parametro

    mov rsp, rbp
    pop rbp
    ret