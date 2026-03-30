; Atividade 2 - calculadora
; main.asm
; Matheus Lucas Ferreira Jacinto, Vinicius Sendoski de Andrade 
; soma, subtração, multiplicação, divição, exponencial, escrevesoluçãook, escrevesoluçãonaook
; nasm -f elf64 main.asm ; gcc -m64 -no-pie main.o -o main.x
%define _exit   60
extern scanf
extern printf
extern fopen
extern fclose
extern fprintf

section .data
    ; entrada terminal
    pfstr1 : db "equação: ", 0
    scstr1 : db "%f %c %f"   
    ; arquivo
    arquivo     : db "equacao.txt", 0 ; nome do aquivo a ser criado
    criaA       : db "a", 0 ; cria um arquivo
    erroCriarA  : db "Não foi possível criar o arquivo '%s'", 10, 0
    escreve     : db "%lf %c %lf = %lf", 10, 0
    escreveErro : db "%lf %c %lf = funcionalidade não disponível", 10, 0
    ; valores para compara com floats
    valorZero   : dd 0.0
    expNegativo : dd 1.0000

section .bss
    ; variaveis
    fp1 : resd 1 ; int1
    fp2 : resd 1 ; int2
    op  : resb 1 ; operador
    res : resd 1 ; resultado
    ; arquivo
    file_handle: resq 1
section .text
    global main
main:
    ; stack-frame
    push rbp
    mov  rbp, rsp

    abreA: ; fopen para o arquivo
        xor  rax, rax
        mov  rdi, arquivo
        mov  rsi, criaA ; o parametro 'a' abre o aquivo e permite o append dos dados
        call fopen
        mov  qword [file_handle], rax

    printaentrada:
        xor rax, rax
        mov rdi, pfstr1 ; string de controle para printf
        mov esi, 1
        call printf

    entradascanf:
        xor rax, rax
        mov rdi, scstr1
        lea rsi, [fp1] ; valor a 
        lea rdx, [op]  ; char
        lea rcx, [fp2] ; valor b
        call scanf

    comparasinal:
        cmp byte [op], "a"  ;a == +
        je adicaoMain
        cmp byte [op], "s" ; s == -
        je subtracaoMain
        cmp byte [op], "m" ; m == *
        je multiplicacaoMain
        cmp byte [op], "d" ; d == /
        je divisaoMain
        cmp byte [op], "e" ; ^ == 2^²
        je exponecialMain

        erroEntrada:
            mov dil, byte [op] ; entrada não normalizada
            jmp runNok

    adicaoMain:
        movss xmm0, [fp1] ; valor a
        movss xmm1, [fp2] ; valor b
        call soma
        movss [res], xmm0 ; retorno do sub-programa 
        mov dil, '+' ; normaliza para escrever no arquivo
        jmp runOk

    subtracaoMain:
        movss xmm0, [fp1] ; valor a
        movss xmm1, [fp2] ; valor b
        call subtracao 
        movss [res], xmm0 ; retorno do sub-programa 
        mov dil, '-' ; normaliza para escrever no arquivo
        jmp runOk

    multiplicacaoMain:
        movss xmm0, [fp1] ; valor a
        movss xmm1, [fp2] ; valor b
        call multiplicacao
        movss [res], xmm0 ; retorno do sub-programa 
        mov dil, '*' ; normaliza para escrever no arquivo
        jmp runOk

    divisaoMain:
        movss  xmm0, dword [valorZero] ; joga zero float para comparar com outro float
        ucomiss xmm0, [fp2] ; para divição não ordenada
        je divNok

        divOk:
            movss xmm0, [fp1] ; valor a
            movss xmm1, [fp2] ; valor b
            call divisao
            movss [res], xmm0 ; retorno do sub-programa 
            mov dil, '/' ; normaliza para escrever no arquivo
            jmp runOk

        divNok: ; caso divição por 0
            mov dil, '/' ; normaliza para escrever no arquivo
            jmp runNok
        
    exponecialMain:
        movss xmm0, [fp1] ; valor a
        convertToExp: ; converte o valor de b para int
            movss     xmm1, [fp2]
            cvttss2si edi, xmm1
        movss xmm2, [expNegativo] ; não li o documento, mas isso funciona kkkkkkkkkkkk
        cmp edi, 0 ; tratamento do documento para expoente 0
        je expoenteZero
        cmp edi, 0 ; tratamento do documento para expoente negativo
        jl expoenteNegativo
        call exponencial

        saidaExp:
            movss [res], xmm0
            mov dil, '^' ; normaliza para escrever no arquivo
            jmp runOk

        expoenteZero:
            movss xmm0, [expNegativo]
            movss [res], xmm0
            mov dil, '^' ; normaliza para escrever no arquivo
            jmp runOk

        expoenteNegativo:
            mov dil, '^' ; normaliza para escrever no arquivo
            jmp runNok
        
    runOk: ; char normalizado nas funções
        movss xmm0, [fp1] ; move float para a call
        movss xmm1, [fp2] ; move float para a call
        movss xmm2, [res] ; move resultado float para call
        call solucaook
        jmp fechaA

    runNok:
        movss xmm0, [fp1] ; move float para a call
        movss xmm1, [fp2] ; move float para a call
        call solucaonaook
        jmp fechaA

    fechaA:
    ; fecha o arquivo
        mov  rdi, qword [file_handle]
        call fclose

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall

%include "soma.asm"
%include "subtracao.asm"
%include "multiplicacao.asm"
%include "divisao.asm"
%include "exponencial.asm"
%include "solucaook.asm"
%include "solucaonaook.asm"