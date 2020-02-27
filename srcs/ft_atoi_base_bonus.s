            global          _ft_atoi_base
            section         .text

_ft_atoi_base:
            xor     rax, rax
            xor     r9, r9
            call    _remove_spaces
            mov     r8, rax
            call    _sign
            call    _check_b10
            call    _get_val_len
            mov     r10, rax
            mov     rcx, r8
            mov     r12, 0
            call    _calc_result
            cmp     rsi, 10
            je      _set_sign_10
            jmp     _end_atoi_base

_end_atoi_base:
            ret

_remove_spaces:
            xor     rcx, rcx
            call    _loop_spaces
            ret

_loop_spaces:
            mov     al,byte [rdi+rcx]
            call    _is_space
            cmp     rax, 0
            je      _end_loop_spaces
            inc     rcx
            jmp     _loop_spaces

_end_loop_spaces:
            mov     rax, rcx
            ret
_is_space:
            cmp     rax, 32
            jle     _ret_1            
            jmp     _ret_0

_ret_1:
            mov     rax, 1
            ret

_ret_0:
            xor     rax, rax
            ret

_ft_pow:
            cmp         rdx, r9
            jnbe        L1
            mov         rax, 1
            ret
L1:
            dec         rdx
            call        _ft_pow
            imul        rax, rsi
            ret

_calc_result:
            cmp		[rdi+rcx], byte 0
			je		_end_loop_calc
            mov     dl, byte [rdi+rcx]
            call    _get_base_val
            cmp     rax, -1
            je      _end_loop_calc
            push    rax
            mov     rax, 1
            mov     rdx, r10
            call    _ft_pow
            mov     r11, rax
            pop     rax
            imul    rax, r11
            add     r12, rax
            inc     rcx
            dec     r10
            jmp     _calc_result

_end_loop_calc:
            mov     rax, r12
            ret

_get_val_len:
            xor     rcx, rcx
            mov     rdx, 0
            mov     rcx, r8
            call    _loop_val_len
            sub     rax, r8
            ret

_loop_val_len:
            cmp		[rdi+rcx], byte 0
			je		_end_loop_val
            mov     dl, byte [rdi+rcx]
            call    _get_base_val
            cmp     rax, -1
            je      _end_loop_val
            inc     rcx
            jmp     _loop_val_len

_end_loop_val:
            mov     rax, rcx
            dec     rax
            ret

_get_base_val:
            cmp     rsi, 10
            je      _check_val_10
            cmp     rsi, 16
            je      _check_val_hex
            cmp     rsi, 2
            je      _check_val_bin

_check_val_10:
            cmp     dl, '0'
            jl      _end_get_base
            cmp     dl, '9'
            jg      _end_get_base
            sub     dl, 48
            xor     rax, rax
            mov     al, dl
            ret

_check_val_hex:
            cmp     dl, 'a'
            jl      _check_val_hex_2
            cmp     dl, 'f'
            jg      _end_get_base
            sub     dl, 87
            xor     rax, rax
            mov     al, dl
            ret

_check_val_hex_2:
            cmp     dl, 'A'
            jl      _check_val_10
            cmp     dl, 'F'
            jg      _end_get_base
            sub     dl, 55
            xor     rax, rax
            mov     al, dl
            ret

_check_val_bin:
            cmp     dl, '0'
            jl      _end_get_base
            cmp     dl, '1'
            jg      _end_get_base
            sub     dl, 48
            xor     rax, rax
            mov     al, dl
            ret
_end_get_base:
            mov     rax, -1
            ret

_sign:
            mov     rcx, rax
            mov     al, byte [rdi+rcx]
            cmp     al, '-'
            je      _set_sign
            cmp     al, '+'
            je      _inc_i
            xor     rax, rax
            mov     rax, rcx
            ret

_set_sign:
            mov     r9, 1
            inc     rcx
            xor     rax, rax
            mov     rax, rcx
            ret

_inc_i:
            inc     rcx
            xor     rax, rax
            mov     rax, rcx
            ret

_set_sign_10:
            cmp     r9, 1
            jne     _end_atoi_base
            neg     rax
            ret
_check_b10:
            cmp     rsi, 10
            je      _set_b10
            ret
_set_b10:
            mov     r8, rax
            ret