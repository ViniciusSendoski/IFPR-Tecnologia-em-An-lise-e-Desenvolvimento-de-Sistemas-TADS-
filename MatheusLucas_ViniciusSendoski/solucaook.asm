solucaook:
    ; criar stack-frame
    push rbp
    mov rbp, rsp

    mov dl, dil ; operador para o fprintf

    convertDoubleOk:
        cvtss2sd xmm0, xmm0 ; variavel a
        cvtss2sd xmm1, xmm1 ; variavel b
        cvtss2sd xmm2, xmm2 ; resultado

    escreveNoAOk:
        xor rax, rax
        mov rdi, [file_handle]
        mov rsi, escreve ; escreve: db "%lf %c %lf = &lf"
        mov rax, 3
        call fprintf

    fimCallOk:

    ; Desfas stack-frame
    mov rsp, rbp
    pop rbp
    ret