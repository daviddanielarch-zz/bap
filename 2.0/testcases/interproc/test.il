addr 0x80484a8 @asm "push   %ebx"
label pc_0x80484a8
T_t:u32 = R_EBX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
addr 0x80484a9 @asm "sub    $0x8,%esp"
label pc_0x80484a9
T_t_79:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 8:u32
R_CF:bool = T_t_79:u32 < 8:u32
R_OF:bool = high:bool((T_t_79:u32 ^ 8:u32) & (T_t_79:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_79:u32 ^ 8:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x80484ac @asm "call   0x00000000080484b1"
label pc_0x80484ac
T_target:u32 = 0x80484b1:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80484b1:u32
jmp 0x80484b1:u32 @str "call"
addr 0x80484b1 @asm "pop    %ebx"
label pc_0x80484b1
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80484b2 @asm "add    $0x1b4f,%ebx"
label pc_0x80484b2
T_t1:u32 = R_EBX:u32
T_t2:u32 = 0x1b4f:u32
R_EBX:u32 = R_EBX:u32 + T_t2:u32
R_CF:bool = R_EBX:u32 < T_t1:u32
R_OF:bool = high:bool((T_t1:u32 ^ ~T_t2:u32) & (T_t1:u32 ^ R_EBX:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EBX:u32 ^ T_t1:u32 ^ T_t2:u32))
R_PF:bool =
  ~low:bool(R_EBX:u32 >> 7:u32 ^ R_EBX:u32 >> 6:u32 ^ R_EBX:u32 >> 5:u32 ^
            R_EBX:u32 >> 4:u32 ^ R_EBX:u32 >> 3:u32 ^ R_EBX:u32 >> 2:u32 ^
            R_EBX:u32 >> 1:u32 ^ R_EBX:u32)
R_SF:bool = high:bool(R_EBX:u32)
R_ZF:bool = 0:u32 == R_EBX:u32
addr 0x80484b8 @asm "add    $0x8,%esp"
label pc_0x80484b8
T_t1_83:u32 = R_ESP:u32
T_t2_84:u32 = 8:u32
R_ESP:u32 = R_ESP:u32 + T_t2_84:u32
R_CF:bool = R_ESP:u32 < T_t1_83:u32
R_OF:bool =
  high:bool((T_t1_83:u32 ^ ~T_t2_84:u32) & (T_t1_83:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t1_83:u32 ^ T_t2_84:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x80484bb @asm "pop    %ebx"
label pc_0x80484bb
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80484bc @asm "ret    "
label pc_0x80484bc
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra:u32 @str "ret"
addr 0x8048430 @asm "push   %ebp"
label pc_0x8048430
T_t_86:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_86:u32
addr 0x8048431 @asm "push   %edi"
label pc_0x8048431
T_t_87:u32 = R_EDI:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_87:u32
addr 0x8048432 @asm "push   %esi"
label pc_0x8048432
T_t_88:u32 = R_ESI:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_88:u32
addr 0x8048433 @asm "push   %ebx"
label pc_0x8048433
T_t_89:u32 = R_EBX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_89:u32
addr 0x8048434 @asm "call   0x00000000080484a2"
label pc_0x8048434
T_target_90:u32 = 0x80484a2:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048439:u32
jmp 0x80484a2:u32 @str "call"
addr 0x8048439 @asm "add    $0x1bc7,%ebx"
label pc_0x8048439
T_t1_91:u32 = R_EBX:u32
T_t2_92:u32 = 0x1bc7:u32
R_EBX:u32 = R_EBX:u32 + T_t2_92:u32
R_CF:bool = R_EBX:u32 < T_t1_91:u32
R_OF:bool =
  high:bool((T_t1_91:u32 ^ ~T_t2_92:u32) & (T_t1_91:u32 ^ R_EBX:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EBX:u32 ^ T_t1_91:u32 ^ T_t2_92:u32))
R_PF:bool =
  ~low:bool(R_EBX:u32 >> 7:u32 ^ R_EBX:u32 >> 6:u32 ^ R_EBX:u32 >> 5:u32 ^
            R_EBX:u32 >> 4:u32 ^ R_EBX:u32 >> 3:u32 ^ R_EBX:u32 >> 2:u32 ^
            R_EBX:u32 >> 1:u32 ^ R_EBX:u32)
R_SF:bool = high:bool(R_EBX:u32)
R_ZF:bool = 0:u32 == R_EBX:u32
addr 0x804843f @asm "sub    $0x1c,%esp"
label pc_0x804843f
T_t_93:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x1c:u32
R_CF:bool = T_t_93:u32 < 0x1c:u32
R_OF:bool = high:bool((T_t_93:u32 ^ 0x1c:u32) & (T_t_93:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_93:u32 ^ 0x1c:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x8048442 @asm "mov    0x30(%esp),%ebp"
label pc_0x8048442
R_EBP:u32 = mem:?u32[R_ESP:u32 + 0x30:u32, e_little]:u32
addr 0x8048446 @asm "lea    -0xf4(%ebx),%edi"
label pc_0x8048446
R_EDI:u32 = R_EBX:u32 + 0xffffff0c:u32
addr 0x804844c @asm "call   0x0000000008048294"
label pc_0x804844c
T_target_94:u32 = 0x8048294:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048451:u32
jmp 0x8048294:u32 @str "call"
addr 0x8048451 @asm "lea    -0xf8(%ebx),%eax"
label pc_0x8048451
R_EAX:u32 = R_EBX:u32 + 0xffffff08:u32
addr 0x8048457 @asm "sub    %eax,%edi"
label pc_0x8048457
T_t_95:u32 = R_EDI:u32
R_EDI:u32 = R_EDI:u32 - R_EAX:u32
R_CF:bool = T_t_95:u32 < R_EAX:u32
R_OF:bool = high:bool((T_t_95:u32 ^ R_EAX:u32) & (T_t_95:u32 ^ R_EDI:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_EDI:u32 ^ T_t_95:u32 ^ R_EAX:u32))
R_PF:bool =
  ~low:bool(R_EDI:u32 >> 7:u32 ^ R_EDI:u32 >> 6:u32 ^ R_EDI:u32 >> 5:u32 ^
            R_EDI:u32 >> 4:u32 ^ R_EDI:u32 >> 3:u32 ^ R_EDI:u32 >> 2:u32 ^
            R_EDI:u32 >> 1:u32 ^ R_EDI:u32)
R_SF:bool = high:bool(R_EDI:u32)
R_ZF:bool = 0:u32 == R_EDI:u32
addr 0x8048459 @asm "sar    $0x2,%edi"
label pc_0x8048459
T_origDEST:u32 = R_EDI:u32
T_origCOUNT:u32 = 2:u32
R_EDI:u32 = R_EDI:u32 $>> 2:u32
R_CF:bool =
  if T_origCOUNT:u32 == 0:u32 then R_CF:bool else
  high:bool(T_origDEST:u32 << 0x20:u32 - T_origCOUNT:u32)
R_OF:bool =
  if T_origCOUNT:u32 == 0:u32 then R_OF:bool else
  if T_origCOUNT:u32 == 1:u32 then false else
  unknown "OF undefined after shift":bool
R_SF:bool =
  if T_origCOUNT:u32 == 0:u32 then R_SF:bool else high:bool(R_EDI:u32)
R_ZF:bool =
  if T_origCOUNT:u32 == 0:u32 then R_ZF:bool else 0:u32 == R_EDI:u32
R_PF:bool =
  if T_origCOUNT:u32 == 0:u32 then R_PF:bool else
  ~low:bool(R_EDI:u32 >> 7:u32 ^ R_EDI:u32 >> 6:u32 ^ R_EDI:u32 >> 5:u32 ^
            R_EDI:u32 >> 4:u32 ^ R_EDI:u32 >> 3:u32 ^ R_EDI:u32 >> 2:u32 ^
            R_EDI:u32 >> 1:u32 ^ R_EDI:u32)
R_AF:bool =
  if T_origCOUNT:u32 == 0:u32 then R_AF:bool else
  unknown "AF undefined after shift":bool
addr 0x804845c @asm "test   %edi,%edi"
label pc_0x804845c
T_t_98:u32 = R_EDI:u32 & R_EDI:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after and":bool
R_PF:bool =
  ~low:bool(T_t_98:u32 >> 7:u32 ^ T_t_98:u32 >> 6:u32 ^ T_t_98:u32 >> 5:u32 ^
            T_t_98:u32 >> 4:u32 ^ T_t_98:u32 >> 3:u32 ^ T_t_98:u32 >> 2:u32 ^
            T_t_98:u32 >> 1:u32 ^ T_t_98:u32)
R_SF:bool = high:bool(T_t_98:u32)
R_ZF:bool = 0:u32 == T_t_98:u32
addr 0x804845e @asm "je     0x0000000008048489"
label pc_0x804845e
cjmp R_ZF:bool, 0x8048489:u32, "nocjmp0"
label nocjmp0
addr 0x8048460 @asm "xor    %esi,%esi"
label pc_0x8048460
R_ESI:u32 = 0:u32
R_AF:bool = unknown "AF is undefined after xor":bool
R_ZF:bool = true
R_PF:bool = true
R_OF:bool = false
R_CF:bool = false
R_SF:bool = false
addr 0x8048462 @asm "lea    0x0(%esi),%esi"
label pc_0x8048462
R_ESI:u32 = R_ESI:u32 + 0:u32
addr 0x8048468 @asm "mov    0x38(%esp),%eax"
label pc_0x8048468
R_EAX:u32 = mem:?u32[R_ESP:u32 + 0x38:u32, e_little]:u32
addr 0x804846c @asm "mov    %ebp,(%esp)"
label pc_0x804846c
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EBP:u32
addr 0x804846f @asm "mov    %eax,0x8(%esp)"
label pc_0x804846f
mem:?u32 = mem:?u32 with [R_ESP:u32 + 8:u32, e_little]:u32 = R_EAX:u32
addr 0x8048473 @asm "mov    0x34(%esp),%eax"
label pc_0x8048473
R_EAX:u32 = mem:?u32[R_ESP:u32 + 0x34:u32, e_little]:u32
addr 0x8048477 @asm "mov    %eax,0x4(%esp)"
label pc_0x8048477
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = R_EAX:u32
addr 0x804847b @asm "call   *-0xf8(%ebx,%esi,4)"
label pc_0x804847b
T_target_99:u32 =
  mem:?u32[R_EBX:u32 + (R_ESI:u32 << 2:u32) + 0xffffff08:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048482:u32
jmp T_target_99:u32 @str "call"
addr 0x8048482 @asm "add    $0x1,%esi"
label pc_0x8048482
T_t1_100:u32 = R_ESI:u32
T_t2_101:u32 = 1:u32
R_ESI:u32 = R_ESI:u32 + T_t2_101:u32
R_CF:bool = R_ESI:u32 < T_t1_100:u32
R_OF:bool =
  high:bool((T_t1_100:u32 ^ ~T_t2_101:u32) & (T_t1_100:u32 ^ R_ESI:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_ESI:u32 ^ T_t1_100:u32 ^ T_t2_101:u32))
R_PF:bool =
  ~low:bool(R_ESI:u32 >> 7:u32 ^ R_ESI:u32 >> 6:u32 ^ R_ESI:u32 >> 5:u32 ^
            R_ESI:u32 >> 4:u32 ^ R_ESI:u32 >> 3:u32 ^ R_ESI:u32 >> 2:u32 ^
            R_ESI:u32 >> 1:u32 ^ R_ESI:u32)
R_SF:bool = high:bool(R_ESI:u32)
R_ZF:bool = 0:u32 == R_ESI:u32
addr 0x8048485 @asm "cmp    %edi,%esi"
label pc_0x8048485
T_t_102:u32 = R_ESI:u32 - R_EDI:u32
R_CF:bool = R_ESI:u32 < R_EDI:u32
R_OF:bool = high:bool((R_ESI:u32 ^ R_EDI:u32) & (R_ESI:u32 ^ T_t_102:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (T_t_102:u32 ^ R_ESI:u32 ^ R_EDI:u32))
R_PF:bool =
  ~low:bool(T_t_102:u32 >> 7:u32 ^ T_t_102:u32 >> 6:u32 ^
            T_t_102:u32 >> 5:u32 ^ T_t_102:u32 >> 4:u32 ^
            T_t_102:u32 >> 3:u32 ^ T_t_102:u32 >> 2:u32 ^
            T_t_102:u32 >> 1:u32 ^ T_t_102:u32)
R_SF:bool = high:bool(T_t_102:u32)
R_ZF:bool = 0:u32 == T_t_102:u32
addr 0x8048487 @asm "jne    0x0000000008048468"
label pc_0x8048487
cjmp ~R_ZF:bool, 0x8048468:u32, "nocjmp1"
label nocjmp1
addr 0x8048489 @asm "add    $0x1c,%esp"
label pc_0x8048489
T_t1_103:u32 = R_ESP:u32
T_t2_104:u32 = 0x1c:u32
R_ESP:u32 = R_ESP:u32 + T_t2_104:u32
R_CF:bool = R_ESP:u32 < T_t1_103:u32
R_OF:bool =
  high:bool((T_t1_103:u32 ^ ~T_t2_104:u32) & (T_t1_103:u32 ^ R_ESP:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t1_103:u32 ^ T_t2_104:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x804848c @asm "pop    %ebx"
label pc_0x804848c
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804848d @asm "pop    %esi"
label pc_0x804848d
R_ESI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804848e @asm "pop    %edi"
label pc_0x804848e
R_EDI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804848f @asm "pop    %ebp"
label pc_0x804848f
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x8048490 @asm "ret    "
label pc_0x8048490
T_ra_105:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_105:u32 @str "ret"
addr 0x8048294 @asm "push   %ebx"
label pc_0x8048294
T_t_106:u32 = R_EBX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_106:u32
addr 0x8048295 @asm "sub    $0x8,%esp"
label pc_0x8048295
T_t_107:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 8:u32
R_CF:bool = T_t_107:u32 < 8:u32
R_OF:bool = high:bool((T_t_107:u32 ^ 8:u32) & (T_t_107:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_107:u32 ^ 8:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x8048298 @asm "call   0x000000000804829d"
label pc_0x8048298
T_target_108:u32 = 0x804829d:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x804829d:u32
jmp 0x804829d:u32 @str "call"
addr 0x804829d @asm "pop    %ebx"
label pc_0x804829d
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804829e @asm "add    $0x1d63,%ebx"
label pc_0x804829e
T_t1_109:u32 = R_EBX:u32
T_t2_110:u32 = 0x1d63:u32
R_EBX:u32 = R_EBX:u32 + T_t2_110:u32
R_CF:bool = R_EBX:u32 < T_t1_109:u32
R_OF:bool =
  high:bool((T_t1_109:u32 ^ ~T_t2_110:u32) & (T_t1_109:u32 ^ R_EBX:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_EBX:u32 ^ T_t1_109:u32 ^ T_t2_110:u32))
R_PF:bool =
  ~low:bool(R_EBX:u32 >> 7:u32 ^ R_EBX:u32 >> 6:u32 ^ R_EBX:u32 >> 5:u32 ^
            R_EBX:u32 >> 4:u32 ^ R_EBX:u32 >> 3:u32 ^ R_EBX:u32 >> 2:u32 ^
            R_EBX:u32 >> 1:u32 ^ R_EBX:u32)
R_SF:bool = high:bool(R_EBX:u32)
R_ZF:bool = 0:u32 == R_EBX:u32
addr 0x80482a4 @asm "mov    -0x4(%ebx),%eax"
label pc_0x80482a4
R_EAX:u32 = mem:?u32[R_EBX:u32 + -4:u32, e_little]:u32
addr 0x80482aa @asm "test   %eax,%eax"
label pc_0x80482aa
T_t_111:u32 = R_EAX:u32 & R_EAX:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after and":bool
R_PF:bool =
  ~low:bool(T_t_111:u32 >> 7:u32 ^ T_t_111:u32 >> 6:u32 ^
            T_t_111:u32 >> 5:u32 ^ T_t_111:u32 >> 4:u32 ^
            T_t_111:u32 >> 3:u32 ^ T_t_111:u32 >> 2:u32 ^
            T_t_111:u32 >> 1:u32 ^ T_t_111:u32)
R_SF:bool = high:bool(T_t_111:u32)
R_ZF:bool = 0:u32 == T_t_111:u32
addr 0x80482ac @asm "je     0x00000000080482b3"
label pc_0x80482ac
cjmp R_ZF:bool, 0x80482b3:u32, "nocjmp2"
label nocjmp2
addr 0x80482ae @asm "call   0x00000000080482d0"
label pc_0x80482ae
T_target_112:u32 = 0x80482d0:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80482b3:u32
jmp 0x80482d0:u32 @str "call"
addr 0x80482b3 @asm "add    $0x8,%esp"
label pc_0x80482b3
T_t1_113:u32 = R_ESP:u32
T_t2_114:u32 = 8:u32
R_ESP:u32 = R_ESP:u32 + T_t2_114:u32
R_CF:bool = R_ESP:u32 < T_t1_113:u32
R_OF:bool =
  high:bool((T_t1_113:u32 ^ ~T_t2_114:u32) & (T_t1_113:u32 ^ R_ESP:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t1_113:u32 ^ T_t2_114:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x80482b6 @asm "pop    %ebx"
label pc_0x80482b6
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80482b7 @asm "ret    "
label pc_0x80482b7
T_ra_115:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_115:u32 @str "ret"
addr 0x80482d0 @asm "jmp    *0x804a00c"
label pc_0x80482d0
jmp mem:?u32[0x804a00c:u32, e_little]:u32
addr 0x80484a2 @asm "mov    (%esp),%ebx"
label pc_0x80484a2
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
addr 0x80484a5 @asm "ret    "
label pc_0x80484a5
T_ra_116:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_116:u32 @str "ret"
addr 0x80483dc @asm "push   %ebp"
label pc_0x80483dc
T_t_117:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_117:u32
addr 0x80483dd @asm "mov    %esp,%ebp"
label pc_0x80483dd
R_EBP:u32 = R_ESP:u32
addr 0x80483df @asm "mov    0xc(%ebp),%eax"
label pc_0x80483df
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xc:u32, e_little]:u32
addr 0x80483e2 @asm "mov    0x8(%ebp),%edx"
label pc_0x80483e2
R_EDX:u32 = mem:?u32[R_EBP:u32 + 8:u32, e_little]:u32
addr 0x80483e5 @asm "add    %edx,%eax"
label pc_0x80483e5
T_t1_118:u32 = R_EAX:u32
T_t2_119:u32 = R_EDX:u32
R_EAX:u32 = R_EAX:u32 + T_t2_119:u32
R_CF:bool = R_EAX:u32 < T_t1_118:u32
R_OF:bool =
  high:bool((T_t1_118:u32 ^ ~T_t2_119:u32) & (T_t1_118:u32 ^ R_EAX:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_EAX:u32 ^ T_t1_118:u32 ^ T_t2_119:u32))
R_PF:bool =
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_SF:bool = high:bool(R_EAX:u32)
R_ZF:bool = 0:u32 == R_EAX:u32
addr 0x80483e7 @asm "pop    %ebp"
label pc_0x80483e7
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80483e8 @asm "ret    "
label pc_0x80483e8
T_ra_120:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_120:u32 @str "ret"
addr 0x80483e9 @asm "push   %ebp"
label pc_0x80483e9
T_t_121:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_121:u32
addr 0x80483ea @asm "mov    %esp,%ebp"
label pc_0x80483ea
R_EBP:u32 = R_ESP:u32
addr 0x80483ec @asm "sub    $0x18,%esp"
label pc_0x80483ec
T_t_122:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x18:u32
R_CF:bool = T_t_122:u32 < 0x18:u32
R_OF:bool = high:bool((T_t_122:u32 ^ 0x18:u32) & (T_t_122:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_122:u32 ^ 0x18:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x80483ef @asm "movl   $0x0,-0xc(%ebp)"
label pc_0x80483ef
mem:?u32 = mem:?u32 with [R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 = 0:u32
addr 0x80483f6 @asm "movl   $0x0,-0x8(%ebp)"
label pc_0x80483f6
mem:?u32 = mem:?u32 with [R_EBP:u32 + -8:u32, e_little]:u32 = 0:u32
addr 0x80483fd @asm "movl   $0x0,-0x8(%ebp)"
label pc_0x80483fd
mem:?u32 = mem:?u32 with [R_EBP:u32 + -8:u32, e_little]:u32 = 0:u32
addr 0x8048404 @asm "jmp    0x0000000008048420"
label pc_0x8048404
jmp 0x8048420:u32
addr 0x8048420 @asm "cmpl   $0x1,-0x8(%ebp)"
label pc_0x8048420
T_t_123:u32 = mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 - 1:u32
R_CF:bool = mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 < 1:u32
R_OF:bool =
  high:bool((mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 ^ 1:u32) &
            (mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 ^ T_t_123:u32))
R_AF:bool =
  0x10:u32 ==
  (0x10:u32 &
  (T_t_123:u32 ^ mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 ^ 1:u32))
R_PF:bool =
  ~low:bool(T_t_123:u32 >> 7:u32 ^ T_t_123:u32 >> 6:u32 ^
            T_t_123:u32 >> 5:u32 ^ T_t_123:u32 >> 4:u32 ^
            T_t_123:u32 >> 3:u32 ^ T_t_123:u32 >> 2:u32 ^
            T_t_123:u32 >> 1:u32 ^ T_t_123:u32)
R_SF:bool = high:bool(T_t_123:u32)
R_ZF:bool = 0:u32 == T_t_123:u32
addr 0x8048424 @asm "jle    0x0000000008048406"
label pc_0x8048424
cjmp R_ZF:bool | R_SF:bool ^ R_OF:bool, 0x8048406:u32, "nocjmp3"
label nocjmp3
addr 0x8048426 @asm "mov    -0xc(%ebp),%eax"
label pc_0x8048426
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32
addr 0x8048429 @asm "leave  "
label pc_0x8048429
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804842a @asm "ret    "
label pc_0x804842a
T_ra_124:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_124:u32 @str "ret"
addr 0x8048406 @asm "movl   $0x2,0x4(%esp)"
label pc_0x8048406
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = 2:u32
addr 0x804840e @asm "mov    -0x4(%ebp),%eax"
label pc_0x804840e
R_EAX:u32 = mem:?u32[R_EBP:u32 + -4:u32, e_little]:u32
addr 0x8048411 @asm "mov    %eax,(%esp)"
label pc_0x8048411
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
addr 0x8048414 @asm "call   0x00000000080483dc"
label pc_0x8048414
T_target_125:u32 = 0x80483dc:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048419:u32
jmp 0x80483dc:u32 @str "call"
addr 0x8048419 @asm "add    %eax,-0xc(%ebp)"
label pc_0x8048419
T_t1_126:u32 = mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32
T_t2_127:u32 = R_EAX:u32
mem:?u32 =
  mem:?u32 with [R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 =
  mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 + T_t2_127:u32
R_CF:bool = mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 < T_t1_126:u32
R_OF:bool =
  high:bool((T_t1_126:u32 ^ ~T_t2_127:u32) &
            (T_t1_126:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32))
R_AF:bool =
  0x10:u32 ==
  (0x10:u32 &
  (mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 ^ T_t1_126:u32 ^
  T_t2_127:u32))
R_PF:bool =
  ~low:bool(mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 >> 7:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 >> 6:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 >> 5:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 >> 4:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 >> 3:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 >> 2:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32 >> 1:u32 ^
            mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32)
R_SF:bool = high:bool(mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32)
R_ZF:bool = 0:u32 == mem:?u32[R_EBP:u32 + 0xfffffff4:u32, e_little]:u32
addr 0x804841c @asm "addl   $0x1,-0x8(%ebp)"
label pc_0x804841c
T_t1_128:u32 = mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32
T_t2_129:u32 = 1:u32
mem:?u32 =
  mem:?u32 with [R_EBP:u32 + -8:u32, e_little]:u32 =
  mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 + T_t2_129:u32
R_CF:bool = mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 < T_t1_128:u32
R_OF:bool =
  high:bool((T_t1_128:u32 ^ ~T_t2_129:u32) &
            (T_t1_128:u32 ^ mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32))
R_AF:bool =
  0x10:u32 ==
  (0x10:u32 &
  (mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 ^ T_t1_128:u32 ^ T_t2_129:u32))
R_PF:bool =
  ~low:bool(mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 >> 7:u32 ^
            mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 >> 6:u32 ^
            mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 >> 5:u32 ^
            mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 >> 4:u32 ^
            mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 >> 3:u32 ^
            mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 >> 2:u32 ^
            mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32 >> 1:u32 ^
            mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32)
R_SF:bool = high:bool(mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32)
R_ZF:bool = 0:u32 == mem:?u32[R_EBP:u32 + -8:u32, e_little]:u32
jmp 0x8048420:u32 @str "rdisasm"
addr 0x80484a0 @asm "repz ret "
label pc_0x80484a0
T_ra_130:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_130:u32 @str "ret"
addr 0x80483b0 @asm "mov    0x8049f10,%eax"
label pc_0x80483b0
R_EAX:u32 = mem:?u32[0x8049f10:u32, e_little]:u32
addr 0x80483b5 @asm "test   %eax,%eax"
label pc_0x80483b5
T_t_131:u32 = R_EAX:u32 & R_EAX:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after and":bool
R_PF:bool =
  ~low:bool(T_t_131:u32 >> 7:u32 ^ T_t_131:u32 >> 6:u32 ^
            T_t_131:u32 >> 5:u32 ^ T_t_131:u32 >> 4:u32 ^
            T_t_131:u32 >> 3:u32 ^ T_t_131:u32 >> 2:u32 ^
            T_t_131:u32 >> 1:u32 ^ T_t_131:u32)
R_SF:bool = high:bool(T_t_131:u32)
R_ZF:bool = 0:u32 == T_t_131:u32
addr 0x80483b7 @asm "je     0x00000000080483d7"
label pc_0x80483b7
cjmp R_ZF:bool, 0x80483d7:u32, "nocjmp4"
label nocjmp4
addr 0x80483b9 @asm "mov    $0x0,%eax"
label pc_0x80483b9
R_EAX:u32 = 0:u32
addr 0x80483be @asm "test   %eax,%eax"
label pc_0x80483be
T_t_132:u32 = R_EAX:u32 & R_EAX:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after and":bool
R_PF:bool =
  ~low:bool(T_t_132:u32 >> 7:u32 ^ T_t_132:u32 >> 6:u32 ^
            T_t_132:u32 >> 5:u32 ^ T_t_132:u32 >> 4:u32 ^
            T_t_132:u32 >> 3:u32 ^ T_t_132:u32 >> 2:u32 ^
            T_t_132:u32 >> 1:u32 ^ T_t_132:u32)
R_SF:bool = high:bool(T_t_132:u32)
R_ZF:bool = 0:u32 == T_t_132:u32
addr 0x80483c0 @asm "je     0x00000000080483d7"
label pc_0x80483c0
cjmp R_ZF:bool, 0x80483d7:u32, "nocjmp5"
label nocjmp5
addr 0x80483c2 @asm "push   %ebp"
label pc_0x80483c2
T_t_133:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_133:u32
addr 0x80483c3 @asm "mov    %esp,%ebp"
label pc_0x80483c3
R_EBP:u32 = R_ESP:u32
addr 0x80483c5 @asm "sub    $0x18,%esp"
label pc_0x80483c5
T_t_134:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x18:u32
R_CF:bool = T_t_134:u32 < 0x18:u32
R_OF:bool = high:bool((T_t_134:u32 ^ 0x18:u32) & (T_t_134:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_134:u32 ^ 0x18:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x80483c8 @asm "movl   $0x8049f10,(%esp)"
label pc_0x80483c8
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8049f10:u32
addr 0x80483cf @asm "call   *%eax"
label pc_0x80483cf
T_target_135:u32 = R_EAX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80483d1:u32
jmp T_target_135:u32 @str "call"
addr 0x80483d1 @asm "leave  "
label pc_0x80483d1
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80483d2 @asm "jmp    0x0000000008048350"
label pc_0x80483d2
jmp 0x8048350:u32
addr 0x8048350 @asm "mov    $0x804a01c,%eax"
label pc_0x8048350
R_EAX:u32 = 0x804a01c:u32
addr 0x8048355 @asm "sub    $0x804a01c,%eax"
label pc_0x8048355
T_t_136:u32 = R_EAX:u32
R_EAX:u32 = R_EAX:u32 - 0x804a01c:u32
R_CF:bool = T_t_136:u32 < 0x804a01c:u32
R_OF:bool =
  high:bool((T_t_136:u32 ^ 0x804a01c:u32) & (T_t_136:u32 ^ R_EAX:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_EAX:u32 ^ T_t_136:u32 ^ 0x804a01c:u32))
R_PF:bool =
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_SF:bool = high:bool(R_EAX:u32)
R_ZF:bool = 0:u32 == R_EAX:u32
addr 0x804835a @asm "sar    $0x2,%eax"
label pc_0x804835a
T_origDEST_137:u32 = R_EAX:u32
T_origCOUNT_138:u32 = 2:u32
R_EAX:u32 = R_EAX:u32 $>> 2:u32
R_CF:bool =
  if T_origCOUNT_138:u32 == 0:u32 then R_CF:bool else
  high:bool(T_origDEST_137:u32 << 0x20:u32 - T_origCOUNT_138:u32)
R_OF:bool =
  if T_origCOUNT_138:u32 == 0:u32 then R_OF:bool else
  if T_origCOUNT_138:u32 == 1:u32 then false else
  unknown "OF undefined after shift":bool
R_SF:bool =
  if T_origCOUNT_138:u32 == 0:u32 then R_SF:bool else high:bool(R_EAX:u32)
R_ZF:bool =
  if T_origCOUNT_138:u32 == 0:u32 then R_ZF:bool else 0:u32 == R_EAX:u32
R_PF:bool =
  if T_origCOUNT_138:u32 == 0:u32 then R_PF:bool else
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_AF:bool =
  if T_origCOUNT_138:u32 == 0:u32 then R_AF:bool else
  unknown "AF undefined after shift":bool
addr 0x804835d @asm "mov    %eax,%edx"
label pc_0x804835d
R_EDX:u32 = R_EAX:u32
addr 0x804835f @asm "shr    $0x1f,%edx"
label pc_0x804835f
T_origDEST_139:u32 = R_EDX:u32
T_origCOUNT_140:u32 = 0x1f:u32
R_EDX:u32 = R_EDX:u32 >> 0x1f:u32
R_CF:bool =
  if T_origCOUNT_140:u32 == 0:u32 then R_CF:bool else
  high:bool(T_origDEST_139:u32 << 0x20:u32 - T_origCOUNT_140:u32)
R_OF:bool =
  if T_origCOUNT_140:u32 == 0:u32 then R_OF:bool else
  if T_origCOUNT_140:u32 == 1:u32 then high:bool(T_origDEST_139:u32) else
  unknown "OF undefined after shift":bool
R_SF:bool =
  if T_origCOUNT_140:u32 == 0:u32 then R_SF:bool else high:bool(R_EDX:u32)
R_ZF:bool =
  if T_origCOUNT_140:u32 == 0:u32 then R_ZF:bool else 0:u32 == R_EDX:u32
R_PF:bool =
  if T_origCOUNT_140:u32 == 0:u32 then R_PF:bool else
  ~low:bool(R_EDX:u32 >> 7:u32 ^ R_EDX:u32 >> 6:u32 ^ R_EDX:u32 >> 5:u32 ^
            R_EDX:u32 >> 4:u32 ^ R_EDX:u32 >> 3:u32 ^ R_EDX:u32 >> 2:u32 ^
            R_EDX:u32 >> 1:u32 ^ R_EDX:u32)
R_AF:bool =
  if T_origCOUNT_140:u32 == 0:u32 then R_AF:bool else
  unknown "AF undefined after shift":bool
addr 0x8048362 @asm "add    %edx,%eax"
label pc_0x8048362
T_t1_141:u32 = R_EAX:u32
T_t2_142:u32 = R_EDX:u32
R_EAX:u32 = R_EAX:u32 + T_t2_142:u32
R_CF:bool = R_EAX:u32 < T_t1_141:u32
R_OF:bool =
  high:bool((T_t1_141:u32 ^ ~T_t2_142:u32) & (T_t1_141:u32 ^ R_EAX:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_EAX:u32 ^ T_t1_141:u32 ^ T_t2_142:u32))
R_PF:bool =
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_SF:bool = high:bool(R_EAX:u32)
R_ZF:bool = 0:u32 == R_EAX:u32
addr 0x8048364 @asm "sar    %eax"
label pc_0x8048364
T_origDEST_143:u32 = R_EAX:u32
T_origCOUNT_144:u32 = 1:u32
R_EAX:u32 = R_EAX:u32 $>> 1:u32
R_CF:bool =
  if T_origCOUNT_144:u32 == 0:u32 then R_CF:bool else
  high:bool(T_origDEST_143:u32 << 0x20:u32 - T_origCOUNT_144:u32)
R_OF:bool =
  if T_origCOUNT_144:u32 == 0:u32 then R_OF:bool else
  if T_origCOUNT_144:u32 == 1:u32 then false else
  unknown "OF undefined after shift":bool
R_SF:bool =
  if T_origCOUNT_144:u32 == 0:u32 then R_SF:bool else high:bool(R_EAX:u32)
R_ZF:bool =
  if T_origCOUNT_144:u32 == 0:u32 then R_ZF:bool else 0:u32 == R_EAX:u32
R_PF:bool =
  if T_origCOUNT_144:u32 == 0:u32 then R_PF:bool else
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_AF:bool =
  if T_origCOUNT_144:u32 == 0:u32 then R_AF:bool else
  unknown "AF undefined after shift":bool
addr 0x8048366 @asm "jne    0x000000000804836a"
label pc_0x8048366
cjmp ~R_ZF:bool, 0x804836a:u32, "nocjmp6"
label nocjmp6
addr 0x8048368 @asm "repz ret "
label pc_0x8048368
T_ra_145:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_145:u32 @str "ret"
addr 0x804836a @asm "mov    $0x0,%edx"
label pc_0x804836a
R_EDX:u32 = 0:u32
addr 0x804836f @asm "test   %edx,%edx"
label pc_0x804836f
T_t_146:u32 = R_EDX:u32 & R_EDX:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after and":bool
R_PF:bool =
  ~low:bool(T_t_146:u32 >> 7:u32 ^ T_t_146:u32 >> 6:u32 ^
            T_t_146:u32 >> 5:u32 ^ T_t_146:u32 >> 4:u32 ^
            T_t_146:u32 >> 3:u32 ^ T_t_146:u32 >> 2:u32 ^
            T_t_146:u32 >> 1:u32 ^ T_t_146:u32)
R_SF:bool = high:bool(T_t_146:u32)
R_ZF:bool = 0:u32 == T_t_146:u32
addr 0x8048371 @asm "je     0x0000000008048368"
label pc_0x8048371
cjmp R_ZF:bool, 0x8048368:u32, "nocjmp7"
label nocjmp7
addr 0x8048373 @asm "push   %ebp"
label pc_0x8048373
T_t_147:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_147:u32
addr 0x8048374 @asm "mov    %esp,%ebp"
label pc_0x8048374
R_EBP:u32 = R_ESP:u32
addr 0x8048376 @asm "sub    $0x18,%esp"
label pc_0x8048376
T_t_148:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x18:u32
R_CF:bool = T_t_148:u32 < 0x18:u32
R_OF:bool = high:bool((T_t_148:u32 ^ 0x18:u32) & (T_t_148:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_148:u32 ^ 0x18:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x8048379 @asm "mov    %eax,0x4(%esp)"
label pc_0x8048379
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = R_EAX:u32
addr 0x804837d @asm "movl   $0x804a01c,(%esp)"
label pc_0x804837d
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x804a01c:u32
addr 0x8048384 @asm "call   *%edx"
label pc_0x8048384
T_target_149:u32 = R_EDX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048386:u32
jmp T_target_149:u32 @str "call"
addr 0x8048386 @asm "leave  "
label pc_0x8048386
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x8048387 @asm "ret    "
label pc_0x8048387
T_ra_150:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_150:u32 @str "ret"
addr 0x80483d7 @asm "jmp    0x0000000008048350"
label pc_0x80483d7
jmp 0x8048350:u32
addr 0x8048320 @asm "mov    $0x804a01f,%eax"
label pc_0x8048320
R_EAX:u32 = 0x804a01f:u32
addr 0x8048325 @asm "sub    $0x804a01c,%eax"
label pc_0x8048325
T_t_151:u32 = R_EAX:u32
R_EAX:u32 = R_EAX:u32 - 0x804a01c:u32
R_CF:bool = T_t_151:u32 < 0x804a01c:u32
R_OF:bool =
  high:bool((T_t_151:u32 ^ 0x804a01c:u32) & (T_t_151:u32 ^ R_EAX:u32))
R_AF:bool =
  0x10:u32 == (0x10:u32 & (R_EAX:u32 ^ T_t_151:u32 ^ 0x804a01c:u32))
R_PF:bool =
  ~low:bool(R_EAX:u32 >> 7:u32 ^ R_EAX:u32 >> 6:u32 ^ R_EAX:u32 >> 5:u32 ^
            R_EAX:u32 >> 4:u32 ^ R_EAX:u32 >> 3:u32 ^ R_EAX:u32 >> 2:u32 ^
            R_EAX:u32 >> 1:u32 ^ R_EAX:u32)
R_SF:bool = high:bool(R_EAX:u32)
R_ZF:bool = 0:u32 == R_EAX:u32
addr 0x804832a @asm "cmp    $0x6,%eax"
label pc_0x804832a
T_t_152:u32 = R_EAX:u32 - 6:u32
R_CF:bool = R_EAX:u32 < 6:u32
R_OF:bool = high:bool((R_EAX:u32 ^ 6:u32) & (R_EAX:u32 ^ T_t_152:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (T_t_152:u32 ^ R_EAX:u32 ^ 6:u32))
R_PF:bool =
  ~low:bool(T_t_152:u32 >> 7:u32 ^ T_t_152:u32 >> 6:u32 ^
            T_t_152:u32 >> 5:u32 ^ T_t_152:u32 >> 4:u32 ^
            T_t_152:u32 >> 3:u32 ^ T_t_152:u32 >> 2:u32 ^
            T_t_152:u32 >> 1:u32 ^ T_t_152:u32)
R_SF:bool = high:bool(T_t_152:u32)
R_ZF:bool = 0:u32 == T_t_152:u32
addr 0x804832d @asm "ja     0x0000000008048331"
label pc_0x804832d
cjmp ~(R_CF:bool | R_ZF:bool), 0x8048331:u32, "nocjmp8"
label nocjmp8
addr 0x804832f @asm "repz ret "
label pc_0x804832f
T_ra_153:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_153:u32 @str "ret"
addr 0x8048331 @asm "mov    $0x0,%eax"
label pc_0x8048331
R_EAX:u32 = 0:u32
addr 0x8048336 @asm "test   %eax,%eax"
label pc_0x8048336
T_t_154:u32 = R_EAX:u32 & R_EAX:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after and":bool
R_PF:bool =
  ~low:bool(T_t_154:u32 >> 7:u32 ^ T_t_154:u32 >> 6:u32 ^
            T_t_154:u32 >> 5:u32 ^ T_t_154:u32 >> 4:u32 ^
            T_t_154:u32 >> 3:u32 ^ T_t_154:u32 >> 2:u32 ^
            T_t_154:u32 >> 1:u32 ^ T_t_154:u32)
R_SF:bool = high:bool(T_t_154:u32)
R_ZF:bool = 0:u32 == T_t_154:u32
addr 0x8048338 @asm "je     0x000000000804832f"
label pc_0x8048338
cjmp R_ZF:bool, 0x804832f:u32, "nocjmp9"
label nocjmp9
addr 0x804833a @asm "push   %ebp"
label pc_0x804833a
T_t_155:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_155:u32
addr 0x804833b @asm "mov    %esp,%ebp"
label pc_0x804833b
R_EBP:u32 = R_ESP:u32
addr 0x804833d @asm "sub    $0x18,%esp"
label pc_0x804833d
T_t_156:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x18:u32
R_CF:bool = T_t_156:u32 < 0x18:u32
R_OF:bool = high:bool((T_t_156:u32 ^ 0x18:u32) & (T_t_156:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_156:u32 ^ 0x18:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x8048340 @asm "movl   $0x804a01c,(%esp)"
label pc_0x8048340
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x804a01c:u32
addr 0x8048347 @asm "call   *%eax"
label pc_0x8048347
T_target_157:u32 = R_EAX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048349:u32
jmp T_target_157:u32 @str "call"
addr 0x8048349 @asm "leave  "
label pc_0x8048349
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x804834a @asm "ret    "
label pc_0x804834a
T_ra_158:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_158:u32 @str "ret"
addr 0x80482f0 @asm "xor    %ebp,%ebp"
label pc_0x80482f0
R_EBP:u32 = 0:u32
R_AF:bool = unknown "AF is undefined after xor":bool
R_ZF:bool = true
R_PF:bool = true
R_OF:bool = false
R_CF:bool = false
R_SF:bool = false
addr 0x80482f2 @asm "pop    %esi"
label pc_0x80482f2
R_ESI:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80482f3 @asm "mov    %esp,%ecx"
label pc_0x80482f3
R_ECX:u32 = R_ESP:u32
addr 0x80482f5 @asm "and    $0xfffffff0,%esp"
label pc_0x80482f5
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
addr 0x80482f8 @asm "push   %eax"
label pc_0x80482f8
T_t_159:u32 = R_EAX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_159:u32
addr 0x80482f9 @asm "push   %esp"
label pc_0x80482f9
T_t_160:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_160:u32
addr 0x80482fa @asm "push   %edx"
label pc_0x80482fa
T_t_161:u32 = R_EDX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_161:u32
addr 0x80482fb @asm "push   $0x80484a0"
label pc_0x80482fb
T_t_162:u32 = 0x80484a0:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_162:u32
addr 0x8048300 @asm "push   $0x8048430"
label pc_0x8048300
T_t_163:u32 = 0x8048430:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_163:u32
addr 0x8048305 @asm "push   %ecx"
label pc_0x8048305
T_t_164:u32 = R_ECX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_164:u32
addr 0x8048306 @asm "push   %esi"
label pc_0x8048306
T_t_165:u32 = R_ESI:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_165:u32
addr 0x8048307 @asm "push   $0x80483e9"
label pc_0x8048307
T_t_166:u32 = 0x80483e9:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_166:u32
addr 0x804830c @asm "call   0x00000000080482e0"
label pc_0x804830c
T_target_167:u32 = 0x80482e0:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048311:u32
jmp 0x80482e0:u32 @str "call"
addr 0x8048311 @asm "hlt    "
label pc_0x8048311
halt R_EAX:u32
addr 0x8048312 @asm "xchg   %ax,%ax"
label pc_0x8048312
addr 0x8048314 @asm "xchg   %ax,%ax"
label pc_0x8048314
addr 0x8048316 @asm "xchg   %ax,%ax"
label pc_0x8048316
addr 0x8048318 @asm "xchg   %ax,%ax"
label pc_0x8048318
addr 0x804831a @asm "xchg   %ax,%ax"
label pc_0x804831a
addr 0x804831c @asm "xchg   %ax,%ax"
label pc_0x804831c
addr 0x804831e @asm "xchg   %ax,%ax"
label pc_0x804831e
jmp 0x8048320:u32 @str "rdisasm"
addr 0x80482e0 @asm "jmp    *0x804a010"
label pc_0x80482e0
jmp mem:?u32[0x804a010:u32, e_little]:u32
addr 0x8048390 @asm "cmpb   $0x0,0x804a01c"
label pc_0x8048390
T_t_168:u8 = mem:?u32[0x804a01c:u32, e_little]:u8 - 0:u8
R_CF:bool = mem:?u32[0x804a01c:u32, e_little]:u8 < 0:u8
R_OF:bool =
  high:bool((mem:?u32[0x804a01c:u32, e_little]:u8 ^ 0:u8) &
            (mem:?u32[0x804a01c:u32, e_little]:u8 ^ T_t_168:u8))
R_AF:bool =
  0x10:u8 ==
  (0x10:u8 & (T_t_168:u8 ^ mem:?u32[0x804a01c:u32, e_little]:u8 ^ 0:u8))
R_PF:bool =
  ~low:bool(T_t_168:u8 >> 7:u8 ^ T_t_168:u8 >> 6:u8 ^ T_t_168:u8 >> 5:u8 ^
            T_t_168:u8 >> 4:u8 ^ T_t_168:u8 >> 3:u8 ^ T_t_168:u8 >> 2:u8 ^
            T_t_168:u8 >> 1:u8 ^ T_t_168:u8)
R_SF:bool = high:bool(T_t_168:u8)
R_ZF:bool = 0:u8 == T_t_168:u8
addr 0x8048397 @asm "jne    0x00000000080483ac"
label pc_0x8048397
cjmp ~R_ZF:bool, 0x80483ac:u32, "nocjmp10"
label nocjmp10
addr 0x8048399 @asm "push   %ebp"
label pc_0x8048399
T_t_169:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t_169:u32
addr 0x804839a @asm "mov    %esp,%ebp"
label pc_0x804839a
R_EBP:u32 = R_ESP:u32
addr 0x804839c @asm "sub    $0x8,%esp"
label pc_0x804839c
T_t_170:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 8:u32
R_CF:bool = T_t_170:u32 < 8:u32
R_OF:bool = high:bool((T_t_170:u32 ^ 8:u32) & (T_t_170:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_170:u32 ^ 8:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x804839f @asm "call   0x0000000008048320"
label pc_0x804839f
T_target_171:u32 = 0x8048320:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80483a4:u32
jmp 0x8048320:u32 @str "call"
addr 0x80483a4 @asm "movb   $0x1,0x804a01c"
label pc_0x80483a4
mem:?u32 = mem:?u32 with [0x804a01c:u32, e_little]:u8 = 1:u8
addr 0x80483ab @asm "leave  "
label pc_0x80483ab
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x80483ac @asm "repz ret "
label pc_0x80483ac
T_ra_172:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra_172:u32 @str "ret"


