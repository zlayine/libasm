            global      _ft_list_remove_if
            extern      _free
            section     .text

_ft_list_remove_if:
            xor         r10, r10
            mov         rbx, rsi
            mov         r14, rdi
            mov         r12, rdx
            mov         r9, [rdi]
            call        _loop_rem
            mov         rdi, r14
            mov         [rdi], rax
            cmp         r9, byte 0
            jne         _do_prev
            ret

_loop_rem:
            cmp         r9, byte 0
            je          _end_loop_rem
            mov         rdi, [r9]
            mov         rax, r12
            mov         rsi, rbx
            sub         rsp, 40
            call        rax
            add         rsp, 40
            cmp         rax, 0
            je          _remove_elt
            mov         rax, r9
            ret

_remove_elt:
            mov         rcx, [r9+8]
            push        rcx
            push        rbx
            push        r14
            push        r12
            mov         rdi, r9
            call        _free
            pop         r12
            pop         r14
            pop         rbx
            pop         rcx
            mov         r9, rcx
            mov         rax, r9
            jmp         _loop_rem

_end_loop_rem:
            ret

_do_prev:
            mov         r8, r9
            mov         r9, [r9+8]
            jmp         _loop_list

_free_list:
            mov         [r8+8], r10
            push        rcx
            push        rbx
            push        r14
            push        r12
            push        r10
            mov         rdi, r9
            call        _free
            pop         r10
            pop         r12
            pop         r14
            pop         rbx
            pop         rcx
            mov         r9, r10
            jmp         _loop_list
_loop_list: 
            cmp         r9, byte 0
            je          _end_loop_list
            mov         r10, [r9+8]
            mov         rdi, [r9]
            mov         rsi, rbx
            mov         rax, r12
            sub         rsp, 40
            call        rax
            add         rsp, 40
            cmp         rax, 0
            je          _free_list
            mov         r8, r9
            mov         r9, [r9+8]
            jmp         _loop_list

_end_loop_list:
            ret
