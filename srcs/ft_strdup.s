            global      _ft_strdup
            extern      _malloc
            section     .text

_ft_strdup:
			xor		rcx, rcx
            xor     rax, rax
            cmp		rdi, byte 0
			je		_end
_len:
			cmp		[rdi+rcx], byte 0
			je		_allc
			inc		rcx
			jmp		_len
_allc:
            mov     rbx, rdi
            inc     rcx
            mov     rdi, rcx
            sub     rsp, 40
            call    _malloc
            add     rsp, 40
            mov     rdi, rbx
            mov     rdx, rax
            xor     rcx, rcx
            xor     rbx, rbx
            jmp     _cpy
_cpy:
            mov		cl, byte [rdi+rbx]
			cmp		cl, 0
			je		_end
			mov		byte [rdx+rbx], cl
			inc		rbx
			jmp		_cpy

_end:
            mov		byte [rdx+rbx], 0
            mov     rax, rdx
			ret
