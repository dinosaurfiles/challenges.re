m4_include(`commons.m4')

_HEADER_HL1(`Reverse Engineering challenge #5.')

<p>What this code does?</p>

<p>Optimizing GCC 4.8.2:</p>

_PRE_BEGIN
&lt;f>:
   0:	 	push   rbp
   1:	 	mov    rbp,rsp
   4:	 	mov    QWORD PTR [rbp-0x28],rdi
   8:	 	mov    QWORD PTR [rbp-0x30],rsi
   c:	 	mov    QWORD PTR [rbp-0x38],rdx
  10:	 	mov    QWORD PTR [rbp-0x40],rcx
  14:	 	mov    rax,QWORD PTR [rbp-0x40]
  18:	 	cmp    rax,QWORD PTR [rbp-0x30]
  1c:	 	jbe    28 <f+0x28>
  1e:	 	mov    eax,0x0
  23:	 	jmp    b5 <f+0xb5>
  28:	 	mov    QWORD PTR [rbp-0x10],0x0
  2f:	
  30:	 	jmp    98 <f+0x98>
  32:	 	mov    DWORD PTR [rbp-0x14],0x0
  39:	 	mov    QWORD PTR [rbp-0x8],0x0
  40:	
  41:	 	jmp    76 <f+0x76>
  43:	 	mov    rax,QWORD PTR [rbp-0x8]
  47:	 	mov    rdx,QWORD PTR [rbp-0x10]
  4b:	 	add    rdx,rax
  4e:	 	mov    rax,QWORD PTR [rbp-0x28]
  52:	 	add    rax,rdx
  55:	 	movzx  edx,BYTE PTR [rax]
  58:	 	mov    rax,QWORD PTR [rbp-0x10]
  5c:	 	mov    rcx,QWORD PTR [rbp-0x38]
  60:	 	add    rax,rcx
  63:	 	movzx  eax,BYTE PTR [rax]
  66:	 	cmp    dl,al
  68:	 	je     71 <f+0x71>
  6a:	 	mov    DWORD PTR [rbp-0x14],0x1
  71:	 	add    QWORD PTR [rbp-0x8],0x1
  76:	 	mov    rax,QWORD PTR [rbp-0x8]
  7a:	 	cmp    rax,QWORD PTR [rbp-0x40]
  7e:	 	jb     43 <f+0x43>
  80:	 	cmp    DWORD PTR [rbp-0x14],0x0
  84:	 	jne    93 <f+0x93>
  86:	 	mov    rax,QWORD PTR [rbp-0x10]
  8a:	 	mov    rdx,QWORD PTR [rbp-0x28]
  8e:	 	add    rax,rdx
  91:	 	jmp    b5 <f+0xb5>
  93:	 	add    QWORD PTR [rbp-0x10],0x1
  98:	 	mov    rax,QWORD PTR [rbp-0x40]
  9c:	 	mov    rdx,QWORD PTR [rbp-0x30]
  a0:	 	sub    rdx,rax
  a3:	 	mov    rax,rdx
  a6:	 	add    rax,0x1
  aa:	 	cmp    rax,QWORD PTR [rbp-0x10]
  ae:	 	ja     32 <f+0x32>
  b0:	 	mov    eax,0x0
  b5:	 	pop    rbp
  b6:	 	ret    
_PRE_END

<p>Optimizing GCC 4.9.3 for ARM64:</p>

_PRE_BEGIN
&lt;f>:
   0:           cmp     x3, x1
   4:           b.hi    54 <f+0x54>
   8:           sub     x1, x1, x3
   c:           mov     x8, #0x0                        // #0
  10:           adds    x9, x1, #0x1
  14:           b.eq    54 <f+0x54>
  18:           cbz     x3, 5c <f+0x5c>
  1c:           ldrb    w7, [x2,x8]
  20:           mov     x1, #0x0                        // #0
  24:           mov     w4, #0x0                        // #0
  28:           add     x6, x0, x8
  2c:           ldrb    w5, [x6,x1]
  30:           add     x1, x1, #0x1
  34:           cmp     w5, w7
  38:           csinc   w4, w4, wzr, eq
  3c:           cmp     x1, x3
  40:           b.ne    2c <f+0x2c>
  44:           cbz     w4, 60 <f+0x60>
  48:           add     x8, x8, #0x1
  4c:           cmp     x8, x9
  50:           b.ne    18 <f+0x18>
  54:           mov     x0, #0x0                        // #0
  58:           ret
  5c:           add     x6, x0, x8
  60:           mov     x0, x6
  64:           ret
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (ARM mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r7,lr}
        CMP      r3,r1
        SUBLS    r1,r1,r3
        MOVLS    r12,#0
        ADDLS    r5,r1,#1
        BHI      |L0.96|
|L0.24|
        CMP      r12,r5
        MOVCC    r4,#0
        MOVCC    r1,r4
        BCS      |L0.96|
|L0.40|
        CMP      r1,r3
        BCS      |L0.76|
        ADD      r6,r12,r1
        LDRB     r6,[r0,r6]
        LDRB     r7,[r2,r12]
        ADD      r1,r1,#1
        CMP      r6,r7
        MOVNE    r4,#1
        B        |L0.40|
|L0.76|
        CMP      r4,#0
        ADDNE    r12,r12,#1
        ADDEQ    r0,r0,r12
        BNE      |L0.24|
        POP      {r4-r7,pc}
|L0.96|
        MOV      r0,#0
        POP      {r4-r7,pc}
        ENDP
_PRE_END

<p>(ARM) Optimizing Keil 5.05 (Thumb mode):</p>

_PRE_BEGIN
f PROC
        PUSH     {r4-r7,lr}
        CMP      r3,r1
        MOV      r12,r2
        BHI      |L0.52|
        MOVS     r4,#0
        SUBS     r5,r1,r3
        ADDS     r5,r5,#1
        B        |L0.48|
|L0.16|
        MOVS     r6,#0
        MOVS     r1,r6
        B        |L0.38|
|L0.22|
        ADDS     r2,r4,r1
        LDRB     r7,[r0,r2]
        MOV      r2,r12
        LDRB     r2,[r2,r4]
        CMP      r7,r2
        BEQ      |L0.36|
        MOVS     r6,#1
|L0.36|
        ADDS     r1,r1,#1
|L0.38|
        CMP      r1,r3
        BCC      |L0.22|
        CMP      r6,#0
        BEQ      |L0.56|
        ADDS     r4,r4,#1
|L0.48|
        CMP      r5,r4
        BHI      |L0.16|
|L0.52|
        MOVS     r0,#0
        POP      {r4-r7,pc}
|L0.56|
        ADDS     r0,r0,r4
        POP      {r4-r7,pc}
        ENDP
_PRE_END

<p>Optimizing GCC 4.4.5 for MIPS:</p>

_PRE_BEGIN
f:
        sltu    $2,$5,$7
        beq     $2,$0,$L16
        move    $2,$0

$L17:
        j       $31
        nop
$L16:
        addiu   $5,$5,1
        subu    $5,$5,$7
        beq     $5,$0,$L17
        nop
        beq     $7,$0,$L17
        move    $2,$4
        move    $13,$0
$L9:
        addu    $3,$6,$13
        addu    $2,$4,$13
        lbu     $11,0($3)
        move    $8,$2
        move    $3,$0
        move    $12,$0
$L6:
        lbu     $10,0($8)
        addiu   $3,$3,1
        beq     $10,$11,$L5
        sltu    $9,$3,$7

        li      $12,1                   # 0x1
$L5:
        bne     $9,$0,$L6
        addiu   $8,$8,1

        beq     $12,$0,$L17
        addiu   $13,$13,1

        sltu    $2,$13,$5
        bne     $2,$0,$L9
        move    $2,$0

        b       $L17
        nop
_PRE_END

_CHALLENGE_FOOTER()

