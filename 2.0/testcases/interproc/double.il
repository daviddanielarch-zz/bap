/*entry node*/
jmp "fun1_pc_0x80483e9"
label BB_Error
assert false
label fun1_pc_0x80483e9 @asm "push   %ebp"
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
label fun1_pc_0x80483ea @asm "mov    %esp,%ebp"
R_EBP:u32 = R_ESP:u32
label fun1_pc_0x80483ec @asm "sub    $0x18,%esp"
T_t:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x18:u32
R_CF:bool = T_t:u32 < 0x18:u32
R_OF:bool = high:bool((T_t:u32 ^ 0x18:u32) & (T_t:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t:u32 ^ 0x18:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
label fun1_pc_0x80483ef @asm "movl   $0x5,0x4(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = 5:u32
label fun1_pc_0x80483f7 @asm "mov    -0xc(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32
label fun1_pc_0x80483fa @asm "mov    %eax,(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
label fun1_pc_0x80483fd @asm "call   0x00000000080483dc"
T_target:u32 = 0x80483dc:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048402:u32
jmp "fun2_pc_0x80483dc" @str "call"
label fun2_pc_0x80483dc @asm "push   %ebp"
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
label fun2_pc_0x80483dd @asm "mov    %esp,%ebp"
R_EBP:u32 = R_ESP:u32
label fun2_pc_0x80483df @asm "mov    0xc(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xc:u32, e_little]:u32
label fun2_pc_0x80483e2 @asm "mov    0x8(%ebp),%edx"
R_EDX:u32 = mem:?u32[R_EBP:u32 + 8:u32, e_little]:u32
label fun2_pc_0x80483e5 @asm "add    %edx,%eax"
T_t1:u32 = R_EAX:u32
T_t2:u32 = R_EDX:u32
R_EAX:u32 = R_EAX:u32 + T_t2:u32
R_CF:bool = R_EAX:u32 < T_t1:u32
R_OF:bool = high:bool((T_t1:u32 ^ ~T_t2:u32) & (T_t1:u32 ^ R_EAX:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EAX:u32 ^ T_t1:u32 ^ T_t2:u32))
R_PF:bool =
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_SF:bool = high:bool(R_EAX:u32)
R_ZF:bool = 0:u32 == R_EAX:u32
label fun2_pc_0x80483e7 @asm "pop    %ebp"
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun2_pc_0x80483e8 @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_3:u32 = T_ra:u32
jmp "fun1_pc_0x8048402" @str "ret"
label fun1_pc_0x8048402 @asm "mov    %eax,-0x8(%ebp)"
mem:?u32 = mem:?u32 with [R_EBP:u32 + -8:u32, e_little]:u32 = R_EAX:u32
label fun1_pc_0x8048405 @asm "movl   $0x2,0x4(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = 2:u32
label fun1_pc_0x804840d @asm "mov    -0x8(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32
label fun1_pc_0x8048410 @asm "mov    %eax,(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
label fun1_pc_0x8048413 @asm "call   0x00000000080483dc"
T_target:u32 = 0x80483dc:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048418:u32
jmp "fun4_pc_0x80483dc" @str "call"
label fun4_pc_0x80483dc @asm "push   %ebp"
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
label fun4_pc_0x80483dd @asm "mov    %esp,%ebp"
R_EBP:u32 = R_ESP:u32
label fun4_pc_0x80483df @asm "mov    0xc(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xc:u32, e_little]:u32
label fun4_pc_0x80483e2 @asm "mov    0x8(%ebp),%edx"
R_EDX:u32 = mem:?u32[R_EBP:u32 + 8:u32, e_little]:u32
label fun4_pc_0x80483e5 @asm "add    %edx,%eax"
T_t1:u32 = R_EAX:u32
T_t2:u32 = R_EDX:u32
R_EAX:u32 = R_EAX:u32 + T_t2:u32
R_CF:bool = R_EAX:u32 < T_t1:u32
R_OF:bool = high:bool((T_t1:u32 ^ ~T_t2:u32) & (T_t1:u32 ^ R_EAX:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EAX:u32 ^ T_t1:u32 ^ T_t2:u32))
R_PF:bool =
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_SF:bool = high:bool(R_EAX:u32)
R_ZF:bool = 0:u32 == R_EAX:u32
label fun4_pc_0x80483e7 @asm "pop    %ebp"
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun4_pc_0x80483e8 @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_5:u32 = T_ra:u32
jmp "fun1_pc_0x8048418" @str "ret"
label fun1_pc_0x8048418 @asm "mov    %eax,-0x4(%ebp)"
mem:?u32 = mem:?u32 with [R_EBP:u32 + -4:u32, e_little]:u32 = R_EAX:u32
label fun1_pc_0x804841b @asm "mov    -0x4(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + -4:u32, e_little]:u32
label fun1_pc_0x804841e @asm "leave  "
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun1_pc_0x804841f @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_6:u32 = T_ra:u32
jmp "the_end" @str "ret"
label the_end
halt true
/*exit node*/


