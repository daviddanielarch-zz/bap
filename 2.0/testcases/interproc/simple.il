/*entry node*/
jmp "newlabel_0"
label BB_Error
assert false
label newlabel_0
R_ESP:u32 = 0x80000000:u32
label fun27_pc_0x8048488 @asm "push   %ebx"
T_t:u32 = R_EBX:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = T_t:u32
label fun27_pc_0x8048489 @asm "sub    $0x8,%esp"
T_t:u32 = R_ESP:u32
R_ESP:u32 = R_ESP:u32 - 8:u32
R_CF:bool = T_t:u32 < 8:u32
R_OF:bool = high:bool((T_t:u32 ^ 8:u32) & (T_t:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t:u32 ^ 8:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
label fun27_pc_0x804848c @asm "call   0x0000000008048491"
T_target:u32 = 0x8048491:u32
R_ESP:u32 = R_ESP:u32 - 4:u32
mem:?u32 = mem:?u32 with [R_ESP:u32, e_little]:u32 = 0x8048491:u32
jmp "fun28_pc_0x8048491" @str "call"
label fun28_pc_0x8048491 @asm "pop    %ebx"
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun28_pc_0x8048492 @asm "add    $0x1b6f,%ebx"
T_t1:u32 = R_EBX:u32
T_t2:u32 = 0x1b6f:u32
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
label fun28_pc_0x8048498 @asm "add    $0x8,%esp"
T_t1:u32 = R_ESP:u32
T_t2:u32 = 8:u32
R_ESP:u32 = R_ESP:u32 + T_t2:u32
R_CF:bool = R_ESP:u32 < T_t1:u32
R_OF:bool = high:bool((T_t1:u32 ^ ~T_t2:u32) & (T_t1:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t1:u32 ^ T_t2:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
label fun28_pc_0x804849b @asm "pop    %ebx"
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun28_pc_0x804849c @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_29:u32 = T_ra:u32
jmp "fun27_pc_0x8048491" @str "ret"
label fun27_pc_0x8048491 @asm "pop    %ebx"
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun27_pc_0x8048492 @asm "add    $0x1b6f,%ebx"
T_t1:u32 = R_EBX:u32
T_t2:u32 = 0x1b6f:u32
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
label fun27_pc_0x8048498 @asm "add    $0x8,%esp"
T_t1:u32 = R_ESP:u32
T_t2:u32 = 8:u32
R_ESP:u32 = R_ESP:u32 + T_t2:u32
R_CF:bool = R_ESP:u32 < T_t1:u32
R_OF:bool = high:bool((T_t1:u32 ^ ~T_t2:u32) & (T_t1:u32 ^ R_ESP:u32))
R_AF:bool = 0x10:u32 == (0x10:u32 & (R_ESP:u32 ^ T_t1:u32 ^ T_t2:u32))
R_PF:bool =
  ~low:bool(R_ESP:u32 >> 7:u32 ^ R_ESP:u32 >> 6:u32 ^ R_ESP:u32 >> 5:u32 ^
            R_ESP:u32 >> 4:u32 ^ R_ESP:u32 >> 3:u32 ^ R_ESP:u32 >> 2:u32 ^
            R_ESP:u32 >> 1:u32 ^ R_ESP:u32)
R_SF:bool = high:bool(R_ESP:u32)
R_ZF:bool = 0:u32 == R_ESP:u32
label fun27_pc_0x804849b @asm "pop    %ebx"
R_EBX:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
label fun27_pc_0x804849c @asm "ret    "
T_ra:u32 = mem:?u32[R_ESP:u32, e_little]:u32
R_ESP:u32 = R_ESP:u32 + 4:u32
bof_30:u32 = T_ra:u32
jmp "the_end" @str "ret"
label the_end
halt true
/*exit node*/


