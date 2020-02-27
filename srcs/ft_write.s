            global      _ft_write
            section     .text

_ft_write:
            mov     r8, rdx
            cmp     rdi, 0
            jl      _error
            mov     rax, 0x02000004
            syscall
            call    _check_file
            ret

_error:
            mov     rax, 1
            neg     rax
            ret

_check_file:
            mov     r9, rax
            mov     rdi, rsi
            cmp     r9, r8
            jg      _error
            cmp     r9, 0
            je      _end_check
            mov     rax, r9
            ret
            
_end_check:
            cmp     r9, r8
            jne     _error
            ret

_null:
			mov		rax, rcx
			pop		rcx
			ret