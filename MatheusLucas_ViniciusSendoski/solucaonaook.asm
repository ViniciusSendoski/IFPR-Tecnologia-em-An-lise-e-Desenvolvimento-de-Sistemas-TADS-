solucaonaook:
    ; criar stack-frame
    push rbp
    mov rbp, rsp

    mov dl, dil ; operador para o fprintf

    convertDoubleNok:
        cvtss2sd xmm0, xmm0 ; variavel a
        cvtss2sd xmm1, xmm1 ; variavel b

    escreveNoANok:
        xor rax, rax
        mov rdi, [file_handle]
        mov rsi, escreveErro ; escreve: db "%lf %c %lf = erro"
        mov rax, 2
        call fprintf
        
    fimCallNok:

    ; Desfas stack-frame
    mov rsp, rbp
    pop rbp
    ret