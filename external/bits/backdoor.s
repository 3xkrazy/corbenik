// This is svcBackdoor's code from earlier FIRMs
// Luckily, no ARM9/ARM11 specific instructions are used here.
// It can just be assembled via ARM9 gas.
.section .text
.global _start
_start:
	bic r1, sp, #0xff
	orr r1, r1, #0xf00
	add r1, r1, #0x28
	ldr r2, [r1]
	stmdb r2!, {sp, lr}
	mov sp, r2
	blx r0
	pop {r0, r1}
	mov sp, r0
	bx r1
