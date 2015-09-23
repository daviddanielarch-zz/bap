addr 0x80483ed @asm "push   %ebp"
label pc_0x80483ed
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
addr 0x80483ee @asm "mov    %esp,%ebp"
label pc_0x80483ee
R_EBP:u32 = R_ESP:u32
addr 0x80483f0 @asm "sub    $0x18,%esp"
label pc_0x80483f0
T_t_79:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x18:u32
R_CF:bool = T_t_79:u32 < 0x18:u32
R_OF:bool = high:bool((T_t_79:u32 ^ 0x18:u32) & (T_t_79:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_79:u32 ^ 0x18:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x80483f3 @asm "movl   $0x5,0x4(%esp)"
label pc_0x80483f3
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = 5:u32
addr 0x80483fb @asm "mov    -0x8(%ebp),%eax"
label pc_0x80483fb
R_EAX:u32 = mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32
addr 0x80483fe @asm "mov    %eax,(%esp)"
label pc_0x80483fe
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
addr 0x8048401 @asm "call   0x00000000080483dc"
label pc_0x8048401
T_target:u32 = 0x80483dc:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048406:u32
jmp 0x80483dc:u32 @str "call"
addr 0x8048406 @asm "mov    %eax,-0x4(%ebp)"
label pc_0x8048406
mem:?u32 = mem:?u32 with [R_EBP:u32 + -4:u32, e_little]:u32 = R_EAX:u32
addr 0x8048409 @asm "mov    -0x4(%ebp),%eax"
label pc_0x8048409
R_EAX:u32 = mem:?u32[R_EBP:u32 + -4:u32, e_little]:u32
addr 0x804840c @asm "leave  "
label pc_0x804840c
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804840d @asm "ret    "
label pc_0x804840d
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra:u32 @str "ret"
addr 0x80483dc @asm "push   %ebp"
label pc_0x80483dc
T_t_82:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_82:u32
addr 0x80483dd @asm "mov    %esp,%ebp"
label pc_0x80483dd
R_EBP:u32 = R_ESP:u32
addr 0x80483df @asm "mov    0xc(%ebp),%eax"
label pc_0x80483df
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xc:u32, e_little]:u32
addr 0x80483e2 @asm "mov    0x8(%ebp),%edx"
label pc_0x80483e2
R_EDX:u32 = mem:?u32[R_EBP:u32 + 8:u32, e_little]:u32
addr 0x80483e5 @asm "mov    %edx,%ecx"
label pc_0x80483e5
R_ECX:u32 = R_EDX:u32
addr 0x80483e7 @asm "sub    %eax,%ecx"
label pc_0x80483e7
T_t_83:u32 = R_ECX:u32
R_ECX:u32 = R_ECX:u32 - R_EAX:u32
R_CF:bool = T_t_83:u32 < R_EAX:u32
R_OF:bool = high:bool((T_t_83:u32 ^ R_EAX:u32) & (T_t_83:u32 ^ R_ECX:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ECX:u32 ^ T_t_83:u32 ^ R_EAX:u32))
R_PF:bool =
  ~low:bool(R_ECX:u32 >> 7:u32 ^ R_ECX:u32 >> 6:u32 ^ R_ECX:u32 >> 5:u32 ^
            R_ECX:u32 >> 4:u32 ^ R_ECX:u32 >> 3:u32 ^ R_ECX:u32 >> 2:u32 ^
            R_ECX:u32 >> 1:u32 ^ R_ECX:u32)
R_SF:bool = high:bool(R_ECX:u32)
R_ZF:bool = 0:u32 == R_ECX:u32
addr 0x80483e9 @asm "mov    %ecx,%eax"
label pc_0x80483e9
R_EAX:u32 = R_ECX:u32
addr 0x80483eb @asm "pop    %ebp"
label pc_0x80483eb
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80483ec @asm "ret    "
label pc_0x80483ec
T_ra_84:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_84:u32 @str "ret"


