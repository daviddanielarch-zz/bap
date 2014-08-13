/*entry node*/
addr 0x804843c @asm "push   %ebp"
label pc_0x804843c
T_t:u32 = R_EBP:u32
/* Avoid a model where the ret address is already the value we want*/
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0xbbbbbbbb:u32
R_ESI:u32 = 0x10000000:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
addr 0x804843d @asm "mov    %esp,%ebp"
label pc_0x804843d
R_EBP:u32 = R_ESP:u32
addr 0x804843f @asm "and    $0xfffffff0,%esp"
label pc_0x804843f
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
addr 0x8048442 @asm "sub    $0x20,%esp"
label pc_0x8048442
T_t_81:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x20:u32
R_CF:bool = T_t_81:u32 < 0x20:u32
R_OF:bool = high:bool((T_t_81:u32 ^ 0x20:u32) & (T_t_81:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_81:u32 ^ 0x20:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x8048445 @asm "movl   $0x0,0x1c(%esp)"
label pc_0x8048445
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x1c:u32, e_little]:u32 = 0:u32
addr 0x804844d @asm "movl   $0x0,0x4(%esp)"
label pc_0x804844d
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = 0:u32
addr 0x8048455 @asm "movl   $0x8048528,(%esp)"
label pc_0x8048455
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048528:u32
addr 0x804845c @asm "call   0x0000000008048330"
label pc_0x804845c
T_target:u32 = 0x8048330:u32
/*R_ESP:u32 = R_ESP:u32 - 4:u32*/
/*mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048461:u32*/
/*jmp 0x8048330:u32 @str "call"*/
addr 0x8048461 @asm "mov    %eax,0x1c(%esp)"
label pc_0x8048461
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x1c:u32, e_little]:u32 = R_EAX:u32
addr 0x8048465 @asm "movl   $0x1c,0x8(%esp)"
label pc_0x8048465
mem:?u32 = mem:?u32 with [R_ESP:u32 + 8:u32, e_little]:u32 = 0x1c:u32
addr 0x804846d @asm "lea    0x14(%esp),%eax"
label pc_0x804846d
R_EAX:u32 = R_ESP:u32 + 0x14:u32
addr 0x8048471 @asm "mov    %eax,0x4(%esp)"
label pc_0x8048471
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = R_EAX:u32
addr 0x8048475 @asm "mov    0x1c(%esp),%eax"
label pc_0x8048475
R_EAX:u32 = mem:?u32[R_ESP:u32 + 0x1c:u32, e_little]:u32
addr 0x8048479 @asm "mov    %eax,(%esp)"
label pc_0x8048479
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
addr 0x804847c @asm "call   0x0000000008048310"
label pc_0x804847c
T_target_83:u32 = 0x8048310:u32
/*R_ESP:u32 = R_ESP:u32 - 4:u32*/
/*mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048481:u32*/
jmp 0x8048310:u32
addr 0x8048481 @asm "mov    %eax,0x18(%esp)"
label pc_0x8048481
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x18:u32, e_little]:u32 = R_EAX:u32
addr 0x8048485 @asm "mov    $0x0,%eax"
label pc_0x8048485
R_EAX:u32 = 0:u32
addr 0x804848a @asm "leave  "
label pc_0x804848a
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804848b @asm "ret    "
label pc_0x804848b
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
halt true
/*jmp T_ra:u32 @str "ret"*/
addr 0x8048310 @asm "jmp    *0x804a00c"
label pc_0x804831
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
