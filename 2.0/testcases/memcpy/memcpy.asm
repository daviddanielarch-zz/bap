	SECTION .text
	global main
	main:
	; memcpy simulation 
	push edi
	push esi
	push ecx
	mov edi,[esp+0xc]
	mov esi,[esp+0x10]
	mov ecx,[esp+0x14]
	cld
	rep movsb
	pop edi
	pop esi
	pop ecx
	ret
