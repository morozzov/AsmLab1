section .bss
	num resb 1

section .data
	array db 8, 5, 8, 3, 2, 8
	arr_len equ 6
	msg db ?, 0x0A

section .text

global _start

_start:

	mov eax, 3
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 0x80

	sub [num], BYTE 48

	mov ecx, 0
	mov ebx, 0


cycle:

	mov al, array[ecx]
	cmp al, [num]
	jle out
	inc ecx
	cmp ecx, arr_len
	je end
	jne cycle

out:
	inc ebx
	inc ecx
        cmp ecx, arr_len
	je end
	jne cycle
	


end:
	add bl, 48
	mov msg[0], bl

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, 2
	int 0x80

	mov eax, 1
	int 0x80

