            global      _ft_list_size
            section     .text

_ft_list_size:
            xor     rcx, rcx
            cmp     rdi, byte 0
            je      _end_loop
            inc     rcx
_loop:
            
            cmp     [rdi+8], byte 0
            je      _end_loop
            inc     rcx
            mov     rdi, [rdi+8]
            jmp     _loop
_end_loop:
            mov     rax, rcx
            ret