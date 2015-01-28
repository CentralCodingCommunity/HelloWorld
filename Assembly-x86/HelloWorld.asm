section .data			; section for data
str: db 'Hello, World!', 0Ah	; message string with new-line char at the end (10 decimal)
str_len: equ $ - str		; calculate length of string (bytes) by subtracting this' address from the str's start address

section .text			; this is the code section
global _start			; _start is the entry point and needs global scope to be seen by the linker

_start:				; definition of _start procedure
	mov eax, 4		; specify the sys_write function code
	mov ebx, 1		; specify file descriptor (stdout)

	mov ecx, str		; move start _address_ of string message to ecx register
	mov edx, str_len	; move length of message (in bytes)
	int 80h			; interrupt kernel to perform the system call

	mov eax, 1		; specify sys_exit function code
	mov ebx, 0		; specify return code for OS
	int 80h			; interrupt kernel to perform system call (to exit)
