addr 0x804848c @asm "push   %ebp"
label pc_0x804848c
T_t:u32 = R_EBP:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
addr 0x804848d @asm "mov    %esp,%ebp"
label pc_0x804848d
R_EBP:u32 = R_ESP:u32
addr 0x804848f @asm "and    $0xfffffff0,%esp"
label pc_0x804848f
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
addr 0x8048492 @asm "sub    $0x40,%esp"
label pc_0x8048492
T_t_79:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 0x40:u32
R_CF:bool = T_t_79:u32 < 0x40:u32
R_OF:bool = high:bool((T_t_79:u32 ^ 0x40:u32) & (T_t_79:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t_79:u32 ^ 0x40:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
addr 0x8048495 @asm "mov    0xc(%ebp),%eax"
label pc_0x8048495
R_EAX:u32 = mem:?u32[R_EBP:u32 + 0xc:u32, e_little]:u32
addr 0x8048498 @asm "mov    %eax,0x1c(%esp)"
label pc_0x8048498
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x1c:u32, e_little]:u32 = R_EAX:u32
addr 0x804849c @asm "mov    %gs:0x14,%eax"
label pc_0x804849c
R_EAX:u32 = mem:?u32[R_GS_BASE:u32 + 0x14:u32, e_little]:u32
addr 0x80484a2 @asm "mov    %eax,0x3c(%esp)"
label pc_0x80484a2
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x3c:u32, e_little]:u32 = R_EAX:u32
addr 0x80484a6 @asm "xor    %eax,%eax"
label pc_0x80484a6
R_EAX:u32 = 0:u32
R_AF:bool = unknown "AF is undefined after xor":bool
R_ZF:bool = true
R_PF:bool = true
R_OF:bool = false
R_CF:bool = false
R_SF:bool = false
addr 0x80484a8 @asm "movl   $0x0,0x2c(%esp)"
label pc_0x80484a8
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x2c:u32, e_little]:u32 = 0:u32
addr 0x80484b0 @asm "movl   $0x0,0x4(%esp)"
label pc_0x80484b0
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = 0:u32
addr 0x80484b8 @asm "movl   $0x80485a8,(%esp)"
label pc_0x80484b8
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80485a8:u32
addr 0x80484bf @asm "call   0x0000000008048380"
label pc_0x80484bf
T_target:u32 = 0x8048380:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80484c4:u32
jmp 0x8048380:u32 @str "call"
addr 0x80484c4 @asm "mov    %eax,0x2c(%esp)"
label pc_0x80484c4
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x2c:u32, e_little]:u32 = R_EAX:u32
addr 0x80484c8 @asm "movl   $0x8,0x8(%esp)"
label pc_0x80484c8
mem:?u32 = mem:?u32 with [R_ESP:u32 + 8:u32, e_little]:u32 = 8:u32
addr 0x80484d0 @asm "lea    0x34(%esp),%eax"
label pc_0x80484d0
R_EAX:u32 = R_ESP:u32 + 0x34:u32
addr 0x80484d4 @asm "mov    %eax,0x4(%esp)"
label pc_0x80484d4
mem:?u32 = mem:?u32 with [R_ESP:u32 + 4:u32, e_little]:u32 = R_EAX:u32
addr 0x80484d8 @asm "mov    0x2c(%esp),%eax"
label pc_0x80484d8
R_EAX:u32 = mem:?u32[R_ESP:u32 + 0x2c:u32, e_little]:u32
addr 0x80484dc @asm "mov    %eax,(%esp)"
label pc_0x80484dc
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = R_EAX:u32
addr 0x80484df @asm "call   0x0000000008048350"
label pc_0x80484df
T_target_81:u32 = 0x8048350:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80484e4:u32
jmp 0x8048350:u32 @str "call"
addr 0x80484e4 @asm "mov    %eax,0x30(%esp)"
label pc_0x80484e4
mem:?u32 = mem:?u32 with [R_ESP:u32 + 0x30:u32, e_little]:u32 = R_EAX:u32
addr 0x80484e8 @asm "mov    $0x0,%eax"
label pc_0x80484e8
R_EAX:u32 = 0:u32
addr 0x80484ed @asm "mov    0x3c(%esp),%edx"
label pc_0x80484ed
R_EDX:u32 = mem:?u32[R_ESP:u32 + 0x3c:u32, e_little]:u32
addr 0x80484f1 @asm "xor    %gs:0x14,%edx"
label pc_0x80484f1
R_EDX:u32 = R_EDX:u32 ^ mem:?u32[R_GS_BASE:u32 + 0x14:u32, e_little]:u32
R_OF:bool = false
R_CF:bool = false
R_AF:bool = unknown "AF is undefined after xor":bool
R_PF:bool =
  ~low:bool(R_EDX:u32 >> 7:u32 ^ R_EDX:u32 >> 6:u32 ^ R_EDX:u32 >> 5:u32 ^
            R_EDX:u32 >> 4:u32 ^ R_EDX:u32 >> 3:u32 ^ R_EDX:u32 >> 2:u32 ^
            R_EDX:u32 >> 1:u32 ^ R_EDX:u32)
R_SF:bool = high:bool(R_EDX:u32)
R_ZF:bool = 0:u32 == R_EDX:u32
addr 0x80484f8 @asm "je     0x00000000080484ff"
label pc_0x80484f8
cjmp R_ZF:bool, 0x80484ff:u32, "nocjmp0"
label nocjmp0
addr 0x80484fa @asm "call   0x0000000008048360"
label pc_0x80484fa
T_target_82:u32 = 0x8048360:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x80484ff:u32
jmp 0x8048360:u32 @str "call"
addr 0x80484ff @asm "leave  "
label pc_0x80484ff
R_ESP:u32 = R_EBP:u32
R_EBP:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
addr 0x8048500 @asm "ret    "
label pc_0x8048500
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
jmp T_ra:u32 @str "ret"
addr 0x8048360 @asm "jmp    *0x804a010"
label pc_0x8048360
jmp mem:?u32[0x804a010:u32, e_little]:u32
addr 0x8048350 @asm "jmp    *0x804a00c"
label pc_0x8048350
jmp mem:?u32[0x804a00c:u32, e_little]:u32
addr 0x8048380 @asm "jmp    *0x804a018"
label pc_0x8048380
jmp mem:?u32[0x804a018:u32, e_little]:u32


