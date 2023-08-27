BITS 16

start:
mov ax, 07C0h		; Set up 4K stack space after this bootloader
add ax, 288		; (4096 + 512) / 16 bytes per paragraph
mov ss, ax
mov sp, 4096

mov ax, 07C0h		; Set data segment to where we're loaded
mov ds, ax

call cls

mov si, text_string	; Put string position into SI
call print_string	; Call our string-printing routine

jmp $			; Jump here - infinite loop!


text_string db 'Hello World from YJAK-OS!', 0


print_string:	; Routine: output string in SI to screen
mov ah, 0Eh		; int 10h 'print char' function

.repeat:
lodsb			; Get character from string
cmp al, 0
je .done		; If char is zero, end of string
int 10h			; Otherwise, print it
jmp .repeat

.done:
ret

cls:
pusha
mov ah, 0x00
mov al, 0x03  ; text mode 80x25 16 colours
int 0x10
popa
ret

times 510-($-$$) db 0	; Pad remainder of boot sector with 0s
dw 0xAA55				; The standard PC boot signature
