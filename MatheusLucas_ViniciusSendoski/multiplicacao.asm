multiplicacao:
    ; criar stack-frame
    push rbp
    mov rbp, rsp
    mulss xmm0, xmm1
    ; Desfas stack-frame
    mov rsp, rbp
    pop rbp
    ret