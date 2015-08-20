        SECTION .text
        global main
main:
        ; strcpy simulation 
        push edi
        push esi
        mov esi, [esp+8]
        mov edi, [esp+10]
copyloop:
        mov al,[esi]
	cmp al,0
	jz endloop 
        mov [edi],al
        inc esi
        inc edi
        jmp copyloop
endloop:
        pop edi
        pop esi
        ret

