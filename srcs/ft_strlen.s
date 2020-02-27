			global		_ft_strlen
			section		.text

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
