addr 0x0 @asm "push   %edi"
label pc_0x0
T_t:u32 = R_EDI:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
addr 0x1 @asm "push   %esi"
label pc_0x1
T_t_79:u32 = R_ESI:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_79:u32
addr 0x2 @asm "push   %ecx"
label pc_0x2
T_t_80:u32 = R_ECX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_80:u32
addr 0x3 @asm "mov    0xc(%esp),%edi"
label pc_0x3
R_EDI:u32 = mem:?u32[R_ESP:u32 + 0x10:u32, e_little]:u32
addr 0x7 @asm "mov    0x10(%esp),%esi"
label pc_0x7
R_ESI:u32 = mem:?u32[R_ESP:u32 + 0x14:u32, e_little]:u32
addr 0xb @asm "mov    0x14(%esp),%ecx"
label pc_0xb
R_ECX:u32 = mem:?u32[R_ESP:u32 + 0x18:u32, e_little]:u32
addr 0xf @asm "cld    "
label pc_0xf
R_DFLAG:u32 = 1:u32
addr 0x10 @asm "rep movsb %ds:(%esi),%es:(%edi)"
label pc_0x10
cjmp R_ECX:u32 == 0:u32, 0x12:u32, "nocjmp1"
label nocjmp1
mem:?u32 =
  mem:?u32 with [R_EDI:u32, e_little]:u8 = mem:?u32[R_ESI:u32, e_little]:u8
R_ESI:u32 = R_ESI:u32 + R_DFLAG:u32
R_EDI:u32 = R_EDI:u32 + R_DFLAG:u32
R_ECX:u32 = R_ECX:u32 - 1:u32
cjmp R_ECX:u32 == 0:u32, 0x12:u32, "nocjmp0"
label nocjmp0
jmp 0x10:u32
addr 0x12 @asm "pop    %edi"
label pc_0x12
R_EDI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x13 @asm "pop    %esi"
label pc_0x13
R_ESI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x14 @asm "pop    %ecx"
label pc_0x14
R_ECX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x15 @asm "ret    "
label pc_0x15
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra:u32 @str "ret"


