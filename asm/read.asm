jmp pc_0x1c
addr 0x1c @asm "push   %eax"
label pc_0x1c
T_t_83:u32 = R_EAX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_83:u32
addr 0x1d @asm "push   %ecx"
label pc_0x1d
T_t_84:u32 = R_ECX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_84:u32
addr 0x1e @asm "push   %edi"
label pc_0x1e
T_t_85:u32 = R_EDI:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_85:u32
addr 0x1f @asm "push   %esi"
label pc_0x1f
T_t_86:u32 = R_ESI:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_86:u32
addr 0x20 @asm "mov    0x4(%esp),%edi"
label pc_0x20
R_EDI:u32 = mem:?u32[R_ESP:u32 + 20:u32, e_little]:u32
addr 0x24 @asm "mov    0x8(%esp),%ecx"
label pc_0x24
R_ECX:u32 = mem:?u32[R_ESP:u32 + 24:u32, e_little]:u32
addr 0x28 @asm "mov    (%esi),%al"
label cjmp0
label pc_0x28
R_EAX:u32 =
  concat:[extract:31:8:[R_EAX:u32]][mem:?u32[R_ESI:u32, e_little]:u8]
addr 0x2a @asm "mov    %al,(%edi)"
label pc_0x2a
mem:?u32 = mem:?u32 with [R_EDI:u32, e_little]:u8 = low:u8(R_EAX:u32)
addr 0x2c @asm "inc    %esi"
label pc_0x2c
T_t_87:u32 = R_ESI:u32
R_ESI:u32 = R_ESI:u32 + 1:u32
R_OF:bool = high:bool((T_t_87:u32 ^ -2:u32) & (T_t_87:u32 ^ R_ESI:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESI:u32 ^ T_t_87:u32 ^ 1:u32))
R_PF:bool =
  ~low:bool(R_ESI:u32 >> 7:u32 ^ R_ESI:u32 >> 6:u32 ^ R_ESI:u32 >> 5:u32 ^
            R_ESI:u32 >> 4:u32 ^ R_ESI:u32 >> 3:u32 ^ R_ESI:u32 >> 2:u32 ^
            R_ESI:u32 >> 1:u32 ^ R_ESI:u32)
R_SF:bool = high:bool(R_ESI:u32)
R_ZF:bool = 0:u32 == R_ESI:u32
addr 0x2d @asm "inc    %edi"
label pc_0x2d
T_t_88:u32 = R_EDI:u32
R_EDI:u32 = R_EDI:u32 + 1:u32
R_OF:bool = high:bool((T_t_88:u32 ^ -2:u32) & (T_t_88:u32 ^ R_EDI:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EDI:u32 ^ T_t_88:u32 ^ 1:u32))
R_PF:bool =
  ~low:bool(R_EDI:u32 >> 7:u32 ^ R_EDI:u32 >> 6:u32 ^ R_EDI:u32 >> 5:u32 ^
            R_EDI:u32 >> 4:u32 ^ R_EDI:u32 >> 3:u32 ^ R_EDI:u32 >> 2:u32 ^
            R_EDI:u32 >> 1:u32 ^ R_EDI:u32)
R_SF:bool = high:bool(R_EDI:u32)
R_ZF:bool = 0:u32 == R_EDI:u32
addr 0x2e @asm "dec    %ecx"
label pc_0x2e
T_t_89:u32 = R_ECX:u32
R_ECX:u32 = R_ECX:u32 - 1:u32
R_OF:bool = high:bool((T_t_89:u32 ^ 1:u32) & (T_t_89:u32 ^ R_ECX:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ECX:u32 ^ T_t_89:u32 ^ 1:u32))
R_PF:bool =
  ~low:bool(R_ECX:u32 >> 7:u32 ^ R_ECX:u32 >> 6:u32 ^ R_ECX:u32 >> 5:u32 ^
            R_ECX:u32 >> 4:u32 ^ R_ECX:u32 >> 3:u32 ^ R_ECX:u32 >> 2:u32 ^
            R_ECX:u32 >> 1:u32 ^ R_ECX:u32)
R_SF:bool = high:bool(R_ECX:u32)
R_ZF:bool = 0:u32 == R_ECX:u32
addr 0x2f @asm "cmp    $0x0,%ecx"
label pc_0x2f
T_t_90:u32 = R_ECX:u32 - 0:u32
R_CF:bool = R_ECX:u32 < 0:u32
R_OF:bool = high:bool((R_ECX:u32 ^ 0:u32) & (R_ECX:u32 ^ T_t_90:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (T_t_90:u32 ^ R_ECX:u32 ^ 0:u32))
R_PF:bool =
  ~low:bool(T_t_90:u32 >> 7:u32 ^ T_t_90:u32 >> 6:u32 ^ T_t_90:u32 >> 5:u32 ^
            T_t_90:u32 >> 4:u32 ^ T_t_90:u32 >> 3:u32 ^ T_t_90:u32 >> 2:u32 ^
            T_t_90:u32 >> 1:u32 ^ T_t_90:u32)
R_SF:bool = high:bool(T_t_90:u32)
R_ZF:bool = 0:u32 == T_t_90:u32
addr 0x32 @asm "jne    0x0000000000000020"
label pc_0x32
cjmp ~R_ZF:bool, "cjmp0", "nocjmp0"
label nocjmp0
addr 0x34 @asm "pop    %eax"
label pc_0x34
R_EAX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x35 @asm "pop    %ecx"
label pc_0x35
R_ECX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x36 @asm "pop    %esi"
label pc_0x36
R_ESI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x37 @asm "pop    %edi"
label pc_0x37
R_EDI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x38 @asm "jmp    0x0000000000000017"
jmp 0x8048481:u32 @str "call"
