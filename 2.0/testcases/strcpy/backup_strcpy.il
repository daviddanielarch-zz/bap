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
addr 0x2 @asm "mov    (%esp),%esi"
label pc_0x2
R_ESI:u32 = mem:?u32[R_ESP:u32 + 0x10:u32, e_little]:u32
addr 0x5 @asm "mov    0x8(%esp),%edi"
label pc_0x5
R_EDI:u32 = mem:?u32[R_ESP:u32 + 0xc:u32, e_little]:u32
addr 0x9 @asm "mov    (%esi),%al"
label pc_0x9
R_EAX:u32 =
  concat:[extract:31:8:[R_EAX:u32]][mem:?u32[R_ESI:u32, e_little]:u8]
addr 0xb @asm "cmp    $0x0,%al"
label pc_0xb
T_t_80:u8 = low:u8(R_EAX:u32) - 0:u8
R_CF:bool = low:u8(R_EAX:u32) < 0:u8
R_OF:bool =
  high:bool((low:u8(R_EAX:u32) ^ 0:u8) & (low:u8(R_EAX:u32) ^ T_t_80:u8))
R_AF:bool = 0x10:u8 == (0x10:u8 & (T_t_80:u8 ^ low:u8(R_EAX:u32) ^ 0:u8))
R_PF:bool =
  ~low:bool(T_t_80:u8 >> 7:u8 ^ T_t_80:u8 >> 6:u8 ^ T_t_80:u8 >> 5:u8 ^
            T_t_80:u8 >> 4:u8 ^ T_t_80:u8 >> 3:u8 ^ T_t_80:u8 >> 2:u8 ^
            T_t_80:u8 >> 1:u8 ^ T_t_80:u8)
R_SF:bool = high:bool(T_t_80:u8)
R_ZF:bool = 0:u8 == T_t_80:u8
addr 0xd @asm "je     0x0000000000000015"
label pc_0xd
cjmp R_ZF:bool, 0x15:u32, "nocjmp0"
label nocjmp0
addr 0xf @asm "mov    %al,(%edi)"
label pc_0xf
mem:?u32 = mem:?u32 with [R_EDI:u32, e_little]:u8 = low:u8(R_EAX:u32)
addr 0x11 @asm "inc    %esi"
label pc_0x11
T_t_81:u32 = R_ESI:u32
R_ESI:u32 = R_ESI:u32 + 1:u32
R_OF:bool = high:bool((T_t_81:u32 ^ -2:u32) & (T_t_81:u32 ^ R_ESI:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESI:u32 ^ T_t_81:u32 ^ 1:u32))
R_PF:bool =
  ~low:bool(R_ESI:u32 >> 7:u32 ^ R_ESI:u32 >> 6:u32 ^ R_ESI:u32 >> 5:u32 ^
            R_ESI:u32 >> 4:u32 ^ R_ESI:u32 >> 3:u32 ^ R_ESI:u32 >> 2:u32 ^
            R_ESI:u32 >> 1:u32 ^ R_ESI:u32)
R_SF:bool = high:bool(R_ESI:u32)
R_ZF:bool = 0:u32 == R_ESI:u32
addr 0x12 @asm "inc    %edi"
label pc_0x12
T_t_82:u32 = R_EDI:u32
R_EDI:u32 = R_EDI:u32 + 1:u32
R_OF:bool = high:bool((T_t_82:u32 ^ -2:u32) & (T_t_82:u32 ^ R_EDI:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EDI:u32 ^ T_t_82:u32 ^ 1:u32))
R_PF:bool =
  ~low:bool(R_EDI:u32 >> 7:u32 ^ R_EDI:u32 >> 6:u32 ^ R_EDI:u32 >> 5:u32 ^
            R_EDI:u32 >> 4:u32 ^ R_EDI:u32 >> 3:u32 ^ R_EDI:u32 >> 2:u32 ^
            R_EDI:u32 >> 1:u32 ^ R_EDI:u32)
R_SF:bool = high:bool(R_EDI:u32)
R_ZF:bool = 0:u32 == R_EDI:u32
addr 0x13 @asm "jmp    0x0000000000000009"
label pc_0x13
jmp 9:u32
addr 0x15 @asm "pop    %edi"
label pc_0x15
R_EDI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x16 @asm "pop    %esi"
label pc_0x16
R_ESI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x17 @asm "ret    "
label pc_0x17
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra:u32 @str "ret"


