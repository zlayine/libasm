            global      _ft_strcmp
            section     .text

_ft_strcmp:
            xor     rcx, rcx
            xor     rbx, rbx
            cmp     rsi, byte 0
            jz		_equal
            cmp     rdi, byte 0
            jz		_equal
_compare:
            mov     cl, byte [rdi]
            mov     bl, byte [rsi]
            cmp     cl, 0
            je      _lower
            cmp     bl, 0
            je      _greater
            cmp     cl, bl
            jg      _greater
            cmp     cl, bl
            jl      _lower
            inc     rdi
            inc     rsi
            jmp     _compare

_greater:
            sub     cl, bl
            xor     rax, rax
            mov     al, cl  
            ret  
_lower:
            sub     bl, cl
            xor     rax, rax
            mov     al, bl
            neg     rax
            ret  
_equal:
            xor     rax, rax
            mov     al, 0x0
            ret