soma:
    ; criar stack-frame
    push rbp
    mov rbp, rsp
    addss xmm0, xmm1
    ; Desfas stack-frame
    mov rsp, rbp
    pop rbp
    ret