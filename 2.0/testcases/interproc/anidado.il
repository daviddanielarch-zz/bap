/*entry node*/
jmp "fun1_pc_0x8048409"
label BB_Error
assert false
label fun1_pc_0x8048409 @asm "push   %ebp"
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
label fun1_pc_0x804840a @asm "mov    %esp,%ebp"
R_EBP:u32 = R_ESP:u32
label fun1_pc_0x804840c @asm "and    $0xfffffff0,%esp"
R_ESP:u32 = R_ESP:u32 & 0xfffffff0:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after and":bool
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
label fun1_pc_0x804840f @asm "sub    $0x20,%esp"
T_t:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x20:u32
R_CF:bool = T_t:u32 < 0x20:u32
R_OF:bool = high:bool((T_t:u32 ^ 0x20:u32) & (T_t:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t:u32 ^ 0x20:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
label fun1_pc_0x8048412 @asm "movl   $0x2,0x4(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = 2:u32
label fun1_pc_0x804841a @asm "mov    0x18(%esp),%eax"
R_EAX:u32 = mem:?u32[R_ESP:u32 + 0x18:u32, e_little]:u32
label fun1_pc_0x804841e @asm "mov    %eax,(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
label fun1_pc_0x8048421 @asm "call   0x00000000080483dc"
T_target:u32 = 0x80483dc:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048426:u32
jmp "fun2_pc_0x80483dc" @str "call"
label fun2_pc_0x80483dc @asm "push   %ebp"
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
label fun2_pc_0x80483dd @asm "mov    %esp,%ebp"
R_EBP:u32 = R_ESP:u32
label fun2_pc_0x80483df @asm "sub    $0x18,%esp"
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
label fun2_pc_0x80483e2 @asm "mov    0xc(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xc:u32, e_little]:u32
label fun2_pc_0x80483e5 @asm "neg    %eax"
T_t:u32 = R_EAX:u32
R_EAX:u32 = 0:u32 - R_EAX:u32
R_CF:bool = if T_t:u32 == 0:u32 then false else true
R_OF:bool = if T_t:u32 == 0x80000000:u32 then true else false
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EAX:u32 ^ T_t:u32 ^ 0:u32))
R_PF:bool =
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_SF:bool = high:bool(R_EAX:u32)
R_ZF:bool = 0:u32 == R_EAX:u32
label fun2_pc_0x80483e7 @asm "mov    %eax,0x4(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = R_EAX:u32
label fun2_pc_0x80483eb @asm "mov    0x8(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + 8:u32, e_little]:u32
label fun2_pc_0x80483ee @asm "mov    %eax,(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
label fun2_pc_0x80483f1 @asm "call   0x00000000080483f8"
T_target:u32 = 0x80483f8:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80483f6:u32
jmp "fun3_pc_0x80483f8" @str "call"
label fun3_pc_0x80483f8 @asm "push   %ebp"
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
label fun3_pc_0x80483f9 @asm "mov    %esp,%ebp"
R_EBP:u32 = R_ESP:u32
label fun3_pc_0x80483fb @asm "mov    0xc(%ebp),%eax"
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xc:u32, e_little]:u32
label fun3_pc_0x80483fe @asm "mov    0x8(%ebp),%edx"
R_EDX:u32 = mem:?u32[R_EBP:u32 + 8:u32, e_little]:u32
label fun3_pc_0x8048401 @asm "mov    %edx,%ecx"
R_ECX:u32 = R_EDX:u32
label fun3_pc_0x8048403 @asm "sub    %eax,%ecx"
T_t:u32 = R_ECX:u32
R_ECX:u32 = R_ECX:u32 - R_EAX:u32
R_CF:bool = T_t:u32 < R_EAX:u32
R_OF:bool = high:bool((T_t:u32 ^ R_EAX:u32) & (T_t:u32 ^ R_ECX:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ECX:u32 ^ T_t:u32 ^ R_EAX:u32))
R_PF:bool =
  ~low:bool(R_ECX:u32 >> 7:u32 ^ R_ECX:u32 >> 6:u32 ^ R_ECX:u32 >> 5:u32 ^
            R_ECX:u32 >> 4:u32 ^ R_ECX:u32 >> 3:u32 ^ R_ECX:u32 >> 2:u32 ^
            R_ECX:u32 >> 1:u32 ^ R_ECX:u32)
R_SF:bool = high:bool(R_ECX:u32)
R_ZF:bool = 0:u32 == R_ECX:u32
label fun3_pc_0x8048405 @asm "mov    %ecx,%eax"
R_EAX:u32 = R_ECX:u32
label fun3_pc_0x8048407 @asm "pop    %ebp"
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun3_pc_0x8048408 @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_4:u32 = T_ra:u32
jmp "fun2_pc_0x80483f6" @str "ret"
label fun2_pc_0x80483f6 @asm "leave  "
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun2_pc_0x80483f7 @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_5:u32 = T_ra:u32
jmp "fun1_pc_0x8048426" @str "ret"
label fun1_pc_0x8048426 @asm "mov    %eax,0x1c(%esp)"
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x1c:u32, e_little]:u32 = R_EAX:u32
label fun1_pc_0x804842a @asm "mov    0x1c(%esp),%eax"
R_EAX:u32 = mem:?u32[R_ESP:u32 + 0x1c:u32, e_little]:u32
label fun1_pc_0x804842e @asm "leave  "
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun1_pc_0x804842f @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_6:u32 = T_ra:u32
jmp "the_end" @str "ret"
label the_end
halt true
/*exit node*/


