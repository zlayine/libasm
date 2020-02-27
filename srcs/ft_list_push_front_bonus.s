            global      _ft_list_push_front
            section     .text

_ft_list_push_front:
            xor     rax, rax
            mov     rax, [rdi]
            mov     [rsi+8], rax
            mov     [rdi], rsi
            ret
