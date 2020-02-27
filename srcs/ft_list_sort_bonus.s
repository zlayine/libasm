            global          _ft_list_sort
            section         .text

_ft_list_sort:
            mov     rcx, 1
_loop_changed:
            cmp     rcx, 0
            je      _end_loop_changed
            mov     rcx, 0
            mov     r9, [rdi]
            call    _loop_list
            jmp     _loop_changed

_end_loop_changed:
            ret


_loop_list:
            cmp     r9, byte 0
            je      _end_loop_list
            mov     r8, [r9+8]
            cmp     r8, byte 0
            je      _end_loop_list
            mov     rdx, rsi
            push    rdi
            push    rsi
            mov     rdi, [r9]
            mov     rsi, [r8]
            sub     rsp, 40
            call    rdx
            add     rsp, 40
            pop     rsi
            pop     rdi
            cmp     rax, 127 
            jl      _swap_data
            mov     r9, [r9+8]
            jmp     _loop_list

_swap_data:
            mov     rdx, [r9]
            mov     rbx, [r8]
            mov     [r9], rbx
            mov     [r8], rdx
            mov     rcx, 1
            mov     r9, [r9+8]
            jmp     _loop_list

_end_loop_list:
            ret