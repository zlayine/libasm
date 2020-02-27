			global		_ft_strcpy
			section		.text
_ft_strcpy:
			mov		rdx, rdi
_next:
			mov		cl, byte [rsi]
			cmp		cl, 0
			je		_null
			mov		byte [rdx], cl
			inc		rsi
			inc		rdx
			jmp		_next
_null:
			mov		byte [rdx], 0
			mov		rax, rdi
			ret