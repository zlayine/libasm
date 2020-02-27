            global      _ft_read
            section     .text

_ft_read:
            cmp     rdi, 0
            jl      _error
            mov     r8, rdx
            mov     rax, 0x02000003
            syscall
            call    _check_file
            ret

_check_file:
            mov     r9, rax
            mov     rdi, rsi
            cmp     r9, r8
            jg      _error
            cmp     r9, 0
            jne     _end_check
            mov     rax, r9
            ret
            
_end_check:
            call    _ft_strlen
            cmp     rax, r9
            jne     _error
            ret

_ft_strlen:
			push	rcx
			xor		rcx, rcx
			cmp		rdi, byte 0
			jz		_null
_len_next:
			cmp		[rdi], byte 0
			jz		_null
			inc		rcx
			inc		rdi
			jmp		_len_next
_null:
			mov		rax, rcx
			pop		rcx
			ret

_error:
            mov     rax, 1
            neg     rax
            ret
