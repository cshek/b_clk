;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module test
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _delay
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_GPIO1	=	0x0040
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;test.c:4: void delay(int j)
;	---------------------------------
; Function delay
; ---------------------------------
_delay::
;test.c:7: for(i=0; i<j; i++)
	ld	bc, #0x0000
00104$:
	ld	hl, #2
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00118$
	xor	a, #0x80
00118$:
	ret	P
	inc	bc
;test.c:9: }
	jr	00104$
;test.c:11: main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;test.c:14: while(1)
	ld	bc, #0x0000
00102$:
;test.c:16: GPIO1=n++;
	ld	a, c
	out	(_GPIO1), a
	inc	bc
;test.c:17: delay(500);
	push	bc
	ld	hl, #0x01f4
	push	hl
	call	_delay
	pop	af
	pop	bc
;test.c:19: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
