   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"object.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.syntax unified
  17              		.code	16
  18              		.thumb_func
  19              		.fpu softvfp
  21              	draw_object:
  22              	.LFB0:
  23              		.file 1 "Z:/Moplaborationer/game/object.c"
   1:Z:/Moplaborationer/game\object.c **** /*
   2:Z:/Moplaborationer/game\object.c ****  * 	object.c
   3:Z:/Moplaborationer/game\object.c ****  *
   4:Z:/Moplaborationer/game\object.c ****  */
   5:Z:/Moplaborationer/game\object.c **** #ifdef SIMULATOR
   6:Z:/Moplaborationer/game\object.c **** 	#define	MAXSPEED	80
   7:Z:/Moplaborationer/game\object.c **** 	#define	AIMAXSPEED	20
   8:Z:/Moplaborationer/game\object.c **** #else
   9:Z:/Moplaborationer/game\object.c **** 	#define	MAXSPEED	4
  10:Z:/Moplaborationer/game\object.c **** 	#define	AIMAXSPEED	1
  11:Z:/Moplaborationer/game\object.c **** #endif	
  12:Z:/Moplaborationer/game\object.c ****  
  13:Z:/Moplaborationer/game\object.c **** #include <math.h>
  14:Z:/Moplaborationer/game\object.c **** #include "graphicdisplay.h"
  15:Z:/Moplaborationer/game\object.c **** #include "object.h"
  16:Z:/Moplaborationer/game\object.c **** #include "math.h"
  17:Z:/Moplaborationer/game\object.c **** #include "AI.h"
  18:Z:/Moplaborationer/game\object.c **** #include "level.h"
  19:Z:/Moplaborationer/game\object.c **** 
  20:Z:/Moplaborationer/game\object.c **** unsigned int rand(void);
  21:Z:/Moplaborationer/game\object.c **** extern POINT currentDot;
  22:Z:/Moplaborationer/game\object.c **** 
  23:Z:/Moplaborationer/game\object.c **** static void draw_object(POBJECT o){
  24              		.loc 1 23 0
  25              		.cfi_startproc
  26              		@ args = 0, pretend = 0, frame = 16
  27              		@ frame_needed = 1, uses_anonymous_args = 0
  28 0000 80B5     		push	{r7, lr}
  29              		.cfi_def_cfa_offset 8
  30              		.cfi_offset 7, -8
  31              		.cfi_offset 14, -4
  32 0002 84B0     		sub	sp, sp, #16
  33              		.cfi_def_cfa_offset 24
  34 0004 00AF     		add	r7, sp, #0
  35              		.cfi_def_cfa_register 7
  36 0006 7860     		str	r0, [r7, #4]
  37              	.LBB2:
  24:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
  38              		.loc 1 24 0
  39 0008 0023     		movs	r3, #0
  40 000a FB60     		str	r3, [r7, #12]
  41 000c 1BE0     		b	.L2
  42              	.L3:
  25:Z:/Moplaborationer/game\object.c **** 		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y);
  43              		.loc 1 25 0 discriminator 3
  44 000e 7B68     		ldr	r3, [r7, #4]
  45 0010 DA68     		ldr	r2, [r3, #12]
  46 0012 7B68     		ldr	r3, [r7, #4]
  47 0014 1968     		ldr	r1, [r3]
  48 0016 FB68     		ldr	r3, [r7, #12]
  49 0018 0433     		adds	r3, r3, #4
  50 001a 5B00     		lsls	r3, r3, #1
  51 001c CB18     		adds	r3, r1, r3
  52 001e 0433     		adds	r3, r3, #4
  53 0020 1B78     		ldrb	r3, [r3]
  54 0022 D018     		adds	r0, r2, r3
  55 0024 7B68     		ldr	r3, [r7, #4]
  56 0026 1A69     		ldr	r2, [r3, #16]
  57 0028 7B68     		ldr	r3, [r7, #4]
  58 002a 1968     		ldr	r1, [r3]
  59 002c FB68     		ldr	r3, [r7, #12]
  60 002e 0433     		adds	r3, r3, #4
  61 0030 5B00     		lsls	r3, r3, #1
  62 0032 CB18     		adds	r3, r1, r3
  63 0034 0533     		adds	r3, r3, #5
  64 0036 1B78     		ldrb	r3, [r3]
  65 0038 D318     		adds	r3, r2, r3
  66 003a 1900     		movs	r1, r3
  67 003c FFF7FEFF 		bl	pixel
  24:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
  68              		.loc 1 24 0 discriminator 3
  69 0040 FB68     		ldr	r3, [r7, #12]
  70 0042 0133     		adds	r3, r3, #1
  71 0044 FB60     		str	r3, [r7, #12]
  72              	.L2:
  24:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
  73              		.loc 1 24 0 is_stmt 0 discriminator 1
  74 0046 7B68     		ldr	r3, [r7, #4]
  75 0048 1B68     		ldr	r3, [r3]
  76 004a 1A68     		ldr	r2, [r3]
  77 004c FB68     		ldr	r3, [r7, #12]
  78 004e 9A42     		cmp	r2, r3
  79 0050 DDDC     		bgt	.L3
  80              	.LBE2:
  26:Z:/Moplaborationer/game\object.c **** 	}
  27:Z:/Moplaborationer/game\object.c **** }
  81              		.loc 1 27 0 is_stmt 1
  82 0052 C046     		nop
  83 0054 BD46     		mov	sp, r7
  84 0056 04B0     		add	sp, sp, #16
  85              		@ sp needed
  86 0058 80BD     		pop	{r7, pc}
  87              		.cfi_endproc
  88              	.LFE0:
  90              		.align	1
  91              		.syntax unified
  92              		.code	16
  93              		.thumb_func
  94              		.fpu softvfp
  96              	xcheckDotCollision:
  97              	.LFB1:
  28:Z:/Moplaborationer/game\object.c **** 
  29:Z:/Moplaborationer/game\object.c **** static int xcheckDotCollision(POBJECT o) {
  98              		.loc 1 29 0
  99              		.cfi_startproc
 100              		@ args = 0, pretend = 0, frame = 32
 101              		@ frame_needed = 1, uses_anonymous_args = 0
 102 005a 80B5     		push	{r7, lr}
 103              		.cfi_def_cfa_offset 8
 104              		.cfi_offset 7, -8
 105              		.cfi_offset 14, -4
 106 005c 88B0     		sub	sp, sp, #32
 107              		.cfi_def_cfa_offset 40
 108 005e 00AF     		add	r7, sp, #0
 109              		.cfi_def_cfa_register 7
 110 0060 7860     		str	r0, [r7, #4]
  30:Z:/Moplaborationer/game\object.c **** 	int xmin = o->posx;						// left side coord
 111              		.loc 1 30 0
 112 0062 7B68     		ldr	r3, [r7, #4]
 113 0064 DB68     		ldr	r3, [r3, #12]
 114 0066 7B61     		str	r3, [r7, #20]
  31:Z:/Moplaborationer/game\object.c **** 	int xmax = o->posx + o->geo->sizex - 1;	// right side coord
 115              		.loc 1 31 0
 116 0068 7B68     		ldr	r3, [r7, #4]
 117 006a DA68     		ldr	r2, [r3, #12]
 118 006c 7B68     		ldr	r3, [r7, #4]
 119 006e 1B68     		ldr	r3, [r3]
 120 0070 5B68     		ldr	r3, [r3, #4]
 121 0072 D318     		adds	r3, r2, r3
 122 0074 013B     		subs	r3, r3, #1
 123 0076 3B61     		str	r3, [r7, #16]
  32:Z:/Moplaborationer/game\object.c **** 	int ymin = o->posy;						// upper side coord
 124              		.loc 1 32 0
 125 0078 7B68     		ldr	r3, [r7, #4]
 126 007a 1B69     		ldr	r3, [r3, #16]
 127 007c FB60     		str	r3, [r7, #12]
  33:Z:/Moplaborationer/game\object.c **** 	
  34:Z:/Moplaborationer/game\object.c **** 	if (o->dirx > 0) {						// if moving right
 128              		.loc 1 34 0
 129 007e 7B68     		ldr	r3, [r7, #4]
 130 0080 5B68     		ldr	r3, [r3, #4]
 131 0082 002B     		cmp	r3, #0
 132 0084 21DD     		ble	.L5
 133              	.LBB3:
  35:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 134              		.loc 1 35 0
 135 0086 0023     		movs	r3, #0
 136 0088 FB61     		str	r3, [r7, #28]
 137 008a 1AE0     		b	.L6
 138              	.L9:
  36:Z:/Moplaborationer/game\object.c **** 			if(xmax+1 == currentDot.x*5-3+2 && ymin+i == currentDot.y*5-2+2) {
 139              		.loc 1 36 0
 140 008c 3B69     		ldr	r3, [r7, #16]
 141 008e 5A1C     		adds	r2, r3, #1
 142 0090 234B     		ldr	r3, .L14
 143 0092 1B78     		ldrb	r3, [r3]
 144 0094 1900     		movs	r1, r3
 145 0096 0B00     		movs	r3, r1
 146 0098 9B00     		lsls	r3, r3, #2
 147 009a 5B18     		adds	r3, r3, r1
 148 009c 013B     		subs	r3, r3, #1
 149 009e 9A42     		cmp	r2, r3
 150 00a0 0CD1     		bne	.L7
 151              		.loc 1 36 0 is_stmt 0 discriminator 1
 152 00a2 FA68     		ldr	r2, [r7, #12]
 153 00a4 FB69     		ldr	r3, [r7, #28]
 154 00a6 D218     		adds	r2, r2, r3
 155 00a8 1D4B     		ldr	r3, .L14
 156 00aa 5B78     		ldrb	r3, [r3, #1]
 157 00ac 1900     		movs	r1, r3
 158 00ae 0B00     		movs	r3, r1
 159 00b0 9B00     		lsls	r3, r3, #2
 160 00b2 5B18     		adds	r3, r3, r1
 161 00b4 9A42     		cmp	r2, r3
 162 00b6 01D1     		bne	.L7
  37:Z:/Moplaborationer/game\object.c **** 				return 1;
 163              		.loc 1 37 0 is_stmt 1
 164 00b8 0123     		movs	r3, #1
 165 00ba 2CE0     		b	.L8
 166              	.L7:
  35:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 167              		.loc 1 35 0 discriminator 2
 168 00bc FB69     		ldr	r3, [r7, #28]
 169 00be 0133     		adds	r3, r3, #1
 170 00c0 FB61     		str	r3, [r7, #28]
 171              	.L6:
  35:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 172              		.loc 1 35 0 is_stmt 0 discriminator 1
 173 00c2 FB69     		ldr	r3, [r7, #28]
 174 00c4 032B     		cmp	r3, #3
 175 00c6 E1DD     		ble	.L9
 176 00c8 24E0     		b	.L10
 177              	.L5:
 178              	.LBE3:
  38:Z:/Moplaborationer/game\object.c **** 			}
  39:Z:/Moplaborationer/game\object.c **** 		}
  40:Z:/Moplaborationer/game\object.c **** 	} else if (o->dirx < 0) {				// if moving left
 179              		.loc 1 40 0 is_stmt 1
 180 00ca 7B68     		ldr	r3, [r7, #4]
 181 00cc 5B68     		ldr	r3, [r3, #4]
 182 00ce 002B     		cmp	r3, #0
 183 00d0 20DA     		bge	.L10
 184              	.LBB4:
  41:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 185              		.loc 1 41 0
 186 00d2 0023     		movs	r3, #0
 187 00d4 BB61     		str	r3, [r7, #24]
 188 00d6 1AE0     		b	.L11
 189              	.L13:
  42:Z:/Moplaborationer/game\object.c **** 			if(xmin-1 == currentDot.x*5-3+2 && ymin+i == currentDot.y*5-2+2) {
 190              		.loc 1 42 0
 191 00d8 7B69     		ldr	r3, [r7, #20]
 192 00da 5A1E     		subs	r2, r3, #1
 193 00dc 104B     		ldr	r3, .L14
 194 00de 1B78     		ldrb	r3, [r3]
 195 00e0 1900     		movs	r1, r3
 196 00e2 0B00     		movs	r3, r1
 197 00e4 9B00     		lsls	r3, r3, #2
 198 00e6 5B18     		adds	r3, r3, r1
 199 00e8 013B     		subs	r3, r3, #1
 200 00ea 9A42     		cmp	r2, r3
 201 00ec 0CD1     		bne	.L12
 202              		.loc 1 42 0 is_stmt 0 discriminator 1
 203 00ee FA68     		ldr	r2, [r7, #12]
 204 00f0 BB69     		ldr	r3, [r7, #24]
 205 00f2 D218     		adds	r2, r2, r3
 206 00f4 0A4B     		ldr	r3, .L14
 207 00f6 5B78     		ldrb	r3, [r3, #1]
 208 00f8 1900     		movs	r1, r3
 209 00fa 0B00     		movs	r3, r1
 210 00fc 9B00     		lsls	r3, r3, #2
 211 00fe 5B18     		adds	r3, r3, r1
 212 0100 9A42     		cmp	r2, r3
 213 0102 01D1     		bne	.L12
  43:Z:/Moplaborationer/game\object.c **** 				return 1;
 214              		.loc 1 43 0 is_stmt 1
 215 0104 0123     		movs	r3, #1
 216 0106 06E0     		b	.L8
 217              	.L12:
  41:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 218              		.loc 1 41 0 discriminator 2
 219 0108 BB69     		ldr	r3, [r7, #24]
 220 010a 0133     		adds	r3, r3, #1
 221 010c BB61     		str	r3, [r7, #24]
 222              	.L11:
  41:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 223              		.loc 1 41 0 is_stmt 0 discriminator 1
 224 010e BB69     		ldr	r3, [r7, #24]
 225 0110 032B     		cmp	r3, #3
 226 0112 E1DD     		ble	.L13
 227              	.L10:
 228              	.LBE4:
  44:Z:/Moplaborationer/game\object.c **** 			}
  45:Z:/Moplaborationer/game\object.c **** 		}
  46:Z:/Moplaborationer/game\object.c **** 	}
  47:Z:/Moplaborationer/game\object.c **** 	return 0;
 229              		.loc 1 47 0 is_stmt 1
 230 0114 0023     		movs	r3, #0
 231              	.L8:
  48:Z:/Moplaborationer/game\object.c **** }
 232              		.loc 1 48 0
 233 0116 1800     		movs	r0, r3
 234 0118 BD46     		mov	sp, r7
 235 011a 08B0     		add	sp, sp, #32
 236              		@ sp needed
 237 011c 80BD     		pop	{r7, pc}
 238              	.L15:
 239 011e C046     		.align	2
 240              	.L14:
 241 0120 00000000 		.word	currentDot
 242              		.cfi_endproc
 243              	.LFE1:
 245              		.align	1
 246              		.syntax unified
 247              		.code	16
 248              		.thumb_func
 249              		.fpu softvfp
 251              	ycheckDotCollision:
 252              	.LFB2:
  49:Z:/Moplaborationer/game\object.c **** 
  50:Z:/Moplaborationer/game\object.c **** static int ycheckDotCollision(POBJECT o) {
 253              		.loc 1 50 0
 254              		.cfi_startproc
 255              		@ args = 0, pretend = 0, frame = 32
 256              		@ frame_needed = 1, uses_anonymous_args = 0
 257 0124 80B5     		push	{r7, lr}
 258              		.cfi_def_cfa_offset 8
 259              		.cfi_offset 7, -8
 260              		.cfi_offset 14, -4
 261 0126 88B0     		sub	sp, sp, #32
 262              		.cfi_def_cfa_offset 40
 263 0128 00AF     		add	r7, sp, #0
 264              		.cfi_def_cfa_register 7
 265 012a 7860     		str	r0, [r7, #4]
  51:Z:/Moplaborationer/game\object.c **** 	int xmin = o->posx;						// left side coord
 266              		.loc 1 51 0
 267 012c 7B68     		ldr	r3, [r7, #4]
 268 012e DB68     		ldr	r3, [r3, #12]
 269 0130 7B61     		str	r3, [r7, #20]
  52:Z:/Moplaborationer/game\object.c **** 	int ymin = o->posy;						// upper side coord
 270              		.loc 1 52 0
 271 0132 7B68     		ldr	r3, [r7, #4]
 272 0134 1B69     		ldr	r3, [r3, #16]
 273 0136 3B61     		str	r3, [r7, #16]
  53:Z:/Moplaborationer/game\object.c **** 	int ymax = o->posy + o->geo->sizey - 1;	// lower side coord
 274              		.loc 1 53 0
 275 0138 7B68     		ldr	r3, [r7, #4]
 276 013a 1A69     		ldr	r2, [r3, #16]
 277 013c 7B68     		ldr	r3, [r7, #4]
 278 013e 1B68     		ldr	r3, [r3]
 279 0140 9B68     		ldr	r3, [r3, #8]
 280 0142 D318     		adds	r3, r2, r3
 281 0144 013B     		subs	r3, r3, #1
 282 0146 FB60     		str	r3, [r7, #12]
  54:Z:/Moplaborationer/game\object.c **** 	
  55:Z:/Moplaborationer/game\object.c **** 	if (o->diry > 0) {						// if moving right
 283              		.loc 1 55 0
 284 0148 7B68     		ldr	r3, [r7, #4]
 285 014a 9B68     		ldr	r3, [r3, #8]
 286 014c 002B     		cmp	r3, #0
 287 014e 21DD     		ble	.L17
 288              	.LBB5:
  56:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 289              		.loc 1 56 0
 290 0150 0023     		movs	r3, #0
 291 0152 FB61     		str	r3, [r7, #28]
 292 0154 1AE0     		b	.L18
 293              	.L21:
  57:Z:/Moplaborationer/game\object.c **** 			if(xmin+i == currentDot.x*5-3+2 && ymax+1 == currentDot.y*5-2+2) {
 294              		.loc 1 57 0
 295 0156 7A69     		ldr	r2, [r7, #20]
 296 0158 FB69     		ldr	r3, [r7, #28]
 297 015a D218     		adds	r2, r2, r3
 298 015c 224B     		ldr	r3, .L26
 299 015e 1B78     		ldrb	r3, [r3]
 300 0160 1900     		movs	r1, r3
 301 0162 0B00     		movs	r3, r1
 302 0164 9B00     		lsls	r3, r3, #2
 303 0166 5B18     		adds	r3, r3, r1
 304 0168 013B     		subs	r3, r3, #1
 305 016a 9A42     		cmp	r2, r3
 306 016c 0BD1     		bne	.L19
 307              		.loc 1 57 0 is_stmt 0 discriminator 1
 308 016e FB68     		ldr	r3, [r7, #12]
 309 0170 5A1C     		adds	r2, r3, #1
 310 0172 1D4B     		ldr	r3, .L26
 311 0174 5B78     		ldrb	r3, [r3, #1]
 312 0176 1900     		movs	r1, r3
 313 0178 0B00     		movs	r3, r1
 314 017a 9B00     		lsls	r3, r3, #2
 315 017c 5B18     		adds	r3, r3, r1
 316 017e 9A42     		cmp	r2, r3
 317 0180 01D1     		bne	.L19
  58:Z:/Moplaborationer/game\object.c **** 				return 1;
 318              		.loc 1 58 0 is_stmt 1
 319 0182 0123     		movs	r3, #1
 320 0184 2CE0     		b	.L20
 321              	.L19:
  56:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 322              		.loc 1 56 0 discriminator 2
 323 0186 FB69     		ldr	r3, [r7, #28]
 324 0188 0133     		adds	r3, r3, #1
 325 018a FB61     		str	r3, [r7, #28]
 326              	.L18:
  56:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 327              		.loc 1 56 0 is_stmt 0 discriminator 1
 328 018c FB69     		ldr	r3, [r7, #28]
 329 018e 032B     		cmp	r3, #3
 330 0190 E1DD     		ble	.L21
 331 0192 24E0     		b	.L22
 332              	.L17:
 333              	.LBE5:
  59:Z:/Moplaborationer/game\object.c **** 			}
  60:Z:/Moplaborationer/game\object.c **** 		}
  61:Z:/Moplaborationer/game\object.c **** 	} else if (o->diry < 0) {				// if moving left
 334              		.loc 1 61 0 is_stmt 1
 335 0194 7B68     		ldr	r3, [r7, #4]
 336 0196 9B68     		ldr	r3, [r3, #8]
 337 0198 002B     		cmp	r3, #0
 338 019a 20DA     		bge	.L22
 339              	.LBB6:
  62:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 340              		.loc 1 62 0
 341 019c 0023     		movs	r3, #0
 342 019e BB61     		str	r3, [r7, #24]
 343 01a0 1AE0     		b	.L23
 344              	.L25:
  63:Z:/Moplaborationer/game\object.c **** 			if(xmin+i == currentDot.x*5-3+2 && ymin-1 == currentDot.y*5-2+2) {
 345              		.loc 1 63 0
 346 01a2 7A69     		ldr	r2, [r7, #20]
 347 01a4 BB69     		ldr	r3, [r7, #24]
 348 01a6 D218     		adds	r2, r2, r3
 349 01a8 0F4B     		ldr	r3, .L26
 350 01aa 1B78     		ldrb	r3, [r3]
 351 01ac 1900     		movs	r1, r3
 352 01ae 0B00     		movs	r3, r1
 353 01b0 9B00     		lsls	r3, r3, #2
 354 01b2 5B18     		adds	r3, r3, r1
 355 01b4 013B     		subs	r3, r3, #1
 356 01b6 9A42     		cmp	r2, r3
 357 01b8 0BD1     		bne	.L24
 358              		.loc 1 63 0 is_stmt 0 discriminator 1
 359 01ba 3B69     		ldr	r3, [r7, #16]
 360 01bc 5A1E     		subs	r2, r3, #1
 361 01be 0A4B     		ldr	r3, .L26
 362 01c0 5B78     		ldrb	r3, [r3, #1]
 363 01c2 1900     		movs	r1, r3
 364 01c4 0B00     		movs	r3, r1
 365 01c6 9B00     		lsls	r3, r3, #2
 366 01c8 5B18     		adds	r3, r3, r1
 367 01ca 9A42     		cmp	r2, r3
 368 01cc 01D1     		bne	.L24
  64:Z:/Moplaborationer/game\object.c **** 				return 1;
 369              		.loc 1 64 0 is_stmt 1
 370 01ce 0123     		movs	r3, #1
 371 01d0 06E0     		b	.L20
 372              	.L24:
  62:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 373              		.loc 1 62 0 discriminator 2
 374 01d2 BB69     		ldr	r3, [r7, #24]
 375 01d4 0133     		adds	r3, r3, #1
 376 01d6 BB61     		str	r3, [r7, #24]
 377              	.L23:
  62:Z:/Moplaborationer/game\object.c **** 		for (int i=0; i<4; i++) {
 378              		.loc 1 62 0 is_stmt 0 discriminator 1
 379 01d8 BB69     		ldr	r3, [r7, #24]
 380 01da 032B     		cmp	r3, #3
 381 01dc E1DD     		ble	.L25
 382              	.L22:
 383              	.LBE6:
  65:Z:/Moplaborationer/game\object.c **** 			}
  66:Z:/Moplaborationer/game\object.c **** 		}
  67:Z:/Moplaborationer/game\object.c **** 	}
  68:Z:/Moplaborationer/game\object.c **** 	return 0;
 384              		.loc 1 68 0 is_stmt 1
 385 01de 0023     		movs	r3, #0
 386              	.L20:
  69:Z:/Moplaborationer/game\object.c **** }
 387              		.loc 1 69 0
 388 01e0 1800     		movs	r0, r3
 389 01e2 BD46     		mov	sp, r7
 390 01e4 08B0     		add	sp, sp, #32
 391              		@ sp needed
 392 01e6 80BD     		pop	{r7, pc}
 393              	.L27:
 394              		.align	2
 395              	.L26:
 396 01e8 00000000 		.word	currentDot
 397              		.cfi_endproc
 398              	.LFE2:
 400              		.align	1
 401              		.global	xcheckCollison
 402              		.syntax unified
 403              		.code	16
 404              		.thumb_func
 405              		.fpu softvfp
 407              	xcheckCollison:
 408              	.LFB3:
  70:Z:/Moplaborationer/game\object.c **** 
  71:Z:/Moplaborationer/game\object.c **** int xcheckCollison(POBJECT o) {
 409              		.loc 1 71 0
 410              		.cfi_startproc
 411              		@ args = 0, pretend = 0, frame = 32
 412              		@ frame_needed = 1, uses_anonymous_args = 0
 413 01ec 80B5     		push	{r7, lr}
 414              		.cfi_def_cfa_offset 8
 415              		.cfi_offset 7, -8
 416              		.cfi_offset 14, -4
 417 01ee 88B0     		sub	sp, sp, #32
 418              		.cfi_def_cfa_offset 40
 419 01f0 00AF     		add	r7, sp, #0
 420              		.cfi_def_cfa_register 7
 421 01f2 7860     		str	r0, [r7, #4]
  72:Z:/Moplaborationer/game\object.c **** 	int xmin = o->posx;						// left side coord
 422              		.loc 1 72 0
 423 01f4 7B68     		ldr	r3, [r7, #4]
 424 01f6 DB68     		ldr	r3, [r3, #12]
 425 01f8 7B61     		str	r3, [r7, #20]
  73:Z:/Moplaborationer/game\object.c **** 	int xmax = o->posx + o->geo->sizex - 1;	// right side coord
 426              		.loc 1 73 0
 427 01fa 7B68     		ldr	r3, [r7, #4]
 428 01fc DA68     		ldr	r2, [r3, #12]
 429 01fe 7B68     		ldr	r3, [r7, #4]
 430 0200 1B68     		ldr	r3, [r3]
 431 0202 5B68     		ldr	r3, [r3, #4]
 432 0204 D318     		adds	r3, r2, r3
 433 0206 013B     		subs	r3, r3, #1
 434 0208 3B61     		str	r3, [r7, #16]
  74:Z:/Moplaborationer/game\object.c **** 	int ymin = o->posy;						// upper side coord
 435              		.loc 1 74 0
 436 020a 7B68     		ldr	r3, [r7, #4]
 437 020c 1B69     		ldr	r3, [r3, #16]
 438 020e FB60     		str	r3, [r7, #12]
  75:Z:/Moplaborationer/game\object.c **** 	
  76:Z:/Moplaborationer/game\object.c **** 	if (o->dirx > 0) {						// if moving right
 439              		.loc 1 76 0
 440 0210 7B68     		ldr	r3, [r7, #4]
 441 0212 5B68     		ldr	r3, [r3, #4]
 442 0214 002B     		cmp	r3, #0
 443 0216 1BDD     		ble	.L29
  77:Z:/Moplaborationer/game\object.c **** 		if ( (xmax + 1) > 128 ) {
 444              		.loc 1 77 0
 445 0218 3B69     		ldr	r3, [r7, #16]
 446 021a 0133     		adds	r3, r3, #1
 447 021c 802B     		cmp	r3, #128
 448 021e 01DD     		ble	.L30
  78:Z:/Moplaborationer/game\object.c **** 			return 1;
 449              		.loc 1 78 0
 450 0220 0123     		movs	r3, #1
 451 0222 35E0     		b	.L31
 452              	.L30:
 453              	.LBB7:
  79:Z:/Moplaborationer/game\object.c **** 		} else {
  80:Z:/Moplaborationer/game\object.c **** 			for (int i=0; i<4; i++) {
 454              		.loc 1 80 0
 455 0224 0023     		movs	r3, #0
 456 0226 FB61     		str	r3, [r7, #28]
 457 0228 0EE0     		b	.L32
 458              	.L34:
  81:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmax+1, ymin+i)) {
 459              		.loc 1 81 0
 460 022a 3B69     		ldr	r3, [r7, #16]
 461 022c 581C     		adds	r0, r3, #1
 462 022e FA68     		ldr	r2, [r7, #12]
 463 0230 FB69     		ldr	r3, [r7, #28]
 464 0232 D318     		adds	r3, r2, r3
 465 0234 1900     		movs	r1, r3
 466 0236 FFF7FEFF 		bl	read_pixel
 467 023a 031E     		subs	r3, r0, #0
 468 023c 01D0     		beq	.L33
  82:Z:/Moplaborationer/game\object.c **** 					return 1;
 469              		.loc 1 82 0
 470 023e 0123     		movs	r3, #1
 471 0240 26E0     		b	.L31
 472              	.L33:
  80:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmax+1, ymin+i)) {
 473              		.loc 1 80 0 discriminator 2
 474 0242 FB69     		ldr	r3, [r7, #28]
 475 0244 0133     		adds	r3, r3, #1
 476 0246 FB61     		str	r3, [r7, #28]
 477              	.L32:
  80:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmax+1, ymin+i)) {
 478              		.loc 1 80 0 is_stmt 0 discriminator 1
 479 0248 FB69     		ldr	r3, [r7, #28]
 480 024a 032B     		cmp	r3, #3
 481 024c EDDD     		ble	.L34
 482 024e 1EE0     		b	.L35
 483              	.L29:
 484              	.LBE7:
  83:Z:/Moplaborationer/game\object.c **** 				}
  84:Z:/Moplaborationer/game\object.c **** 			}
  85:Z:/Moplaborationer/game\object.c **** 		}
  86:Z:/Moplaborationer/game\object.c **** 	} else if (o->dirx < 0) {				// if moving left
 485              		.loc 1 86 0 is_stmt 1
 486 0250 7B68     		ldr	r3, [r7, #4]
 487 0252 5B68     		ldr	r3, [r3, #4]
 488 0254 002B     		cmp	r3, #0
 489 0256 1ADA     		bge	.L35
  87:Z:/Moplaborationer/game\object.c **** 		if ( (xmin - 1) < 1 ) {
 490              		.loc 1 87 0
 491 0258 7B69     		ldr	r3, [r7, #20]
 492 025a 013B     		subs	r3, r3, #1
 493 025c 002B     		cmp	r3, #0
 494 025e 01DC     		bgt	.L36
  88:Z:/Moplaborationer/game\object.c **** 			return 1;
 495              		.loc 1 88 0
 496 0260 0123     		movs	r3, #1
 497 0262 15E0     		b	.L31
 498              	.L36:
 499              	.LBB8:
  89:Z:/Moplaborationer/game\object.c **** 		} else {
  90:Z:/Moplaborationer/game\object.c **** 			for (int i=0; i<4; i++) {
 500              		.loc 1 90 0
 501 0264 0023     		movs	r3, #0
 502 0266 BB61     		str	r3, [r7, #24]
 503 0268 0EE0     		b	.L37
 504              	.L39:
  91:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin-1, ymin+i)) {
 505              		.loc 1 91 0
 506 026a 7B69     		ldr	r3, [r7, #20]
 507 026c 581E     		subs	r0, r3, #1
 508 026e FA68     		ldr	r2, [r7, #12]
 509 0270 BB69     		ldr	r3, [r7, #24]
 510 0272 D318     		adds	r3, r2, r3
 511 0274 1900     		movs	r1, r3
 512 0276 FFF7FEFF 		bl	read_pixel
 513 027a 031E     		subs	r3, r0, #0
 514 027c 01D0     		beq	.L38
  92:Z:/Moplaborationer/game\object.c **** 					return 1;
 515              		.loc 1 92 0
 516 027e 0123     		movs	r3, #1
 517 0280 06E0     		b	.L31
 518              	.L38:
  90:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin-1, ymin+i)) {
 519              		.loc 1 90 0 discriminator 2
 520 0282 BB69     		ldr	r3, [r7, #24]
 521 0284 0133     		adds	r3, r3, #1
 522 0286 BB61     		str	r3, [r7, #24]
 523              	.L37:
  90:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin-1, ymin+i)) {
 524              		.loc 1 90 0 is_stmt 0 discriminator 1
 525 0288 BB69     		ldr	r3, [r7, #24]
 526 028a 032B     		cmp	r3, #3
 527 028c EDDD     		ble	.L39
 528              	.L35:
 529              	.LBE8:
  93:Z:/Moplaborationer/game\object.c **** 				}
  94:Z:/Moplaborationer/game\object.c **** 			}
  95:Z:/Moplaborationer/game\object.c **** 		}
  96:Z:/Moplaborationer/game\object.c **** 	}
  97:Z:/Moplaborationer/game\object.c **** 	return 0;
 530              		.loc 1 97 0 is_stmt 1
 531 028e 0023     		movs	r3, #0
 532              	.L31:
  98:Z:/Moplaborationer/game\object.c **** }
 533              		.loc 1 98 0
 534 0290 1800     		movs	r0, r3
 535 0292 BD46     		mov	sp, r7
 536 0294 08B0     		add	sp, sp, #32
 537              		@ sp needed
 538 0296 80BD     		pop	{r7, pc}
 539              		.cfi_endproc
 540              	.LFE3:
 542              		.align	1
 543              		.global	ycheckCollison
 544              		.syntax unified
 545              		.code	16
 546              		.thumb_func
 547              		.fpu softvfp
 549              	ycheckCollison:
 550              	.LFB4:
  99:Z:/Moplaborationer/game\object.c **** 
 100:Z:/Moplaborationer/game\object.c **** int ycheckCollison(POBJECT o) {
 551              		.loc 1 100 0
 552              		.cfi_startproc
 553              		@ args = 0, pretend = 0, frame = 32
 554              		@ frame_needed = 1, uses_anonymous_args = 0
 555 0298 80B5     		push	{r7, lr}
 556              		.cfi_def_cfa_offset 8
 557              		.cfi_offset 7, -8
 558              		.cfi_offset 14, -4
 559 029a 88B0     		sub	sp, sp, #32
 560              		.cfi_def_cfa_offset 40
 561 029c 00AF     		add	r7, sp, #0
 562              		.cfi_def_cfa_register 7
 563 029e 7860     		str	r0, [r7, #4]
 101:Z:/Moplaborationer/game\object.c **** 	int ymin = o->posy;						// upper side coord
 564              		.loc 1 101 0
 565 02a0 7B68     		ldr	r3, [r7, #4]
 566 02a2 1B69     		ldr	r3, [r3, #16]
 567 02a4 7B61     		str	r3, [r7, #20]
 102:Z:/Moplaborationer/game\object.c **** 	int ymax = o->posy + o->geo->sizey - 1;	// lower side coord
 568              		.loc 1 102 0
 569 02a6 7B68     		ldr	r3, [r7, #4]
 570 02a8 1A69     		ldr	r2, [r3, #16]
 571 02aa 7B68     		ldr	r3, [r7, #4]
 572 02ac 1B68     		ldr	r3, [r3]
 573 02ae 9B68     		ldr	r3, [r3, #8]
 574 02b0 D318     		adds	r3, r2, r3
 575 02b2 013B     		subs	r3, r3, #1
 576 02b4 3B61     		str	r3, [r7, #16]
 103:Z:/Moplaborationer/game\object.c **** 	int xmin = o->posx;						// left side coord
 577              		.loc 1 103 0
 578 02b6 7B68     		ldr	r3, [r7, #4]
 579 02b8 DB68     		ldr	r3, [r3, #12]
 580 02ba FB60     		str	r3, [r7, #12]
 104:Z:/Moplaborationer/game\object.c **** 	
 105:Z:/Moplaborationer/game\object.c **** 	if (o->diry > 0) {						// if moving down
 581              		.loc 1 105 0
 582 02bc 7B68     		ldr	r3, [r7, #4]
 583 02be 9B68     		ldr	r3, [r3, #8]
 584 02c0 002B     		cmp	r3, #0
 585 02c2 1CDD     		ble	.L41
 106:Z:/Moplaborationer/game\object.c **** 		if ( (ymax + 1) > 64 ) {
 586              		.loc 1 106 0
 587 02c4 3B69     		ldr	r3, [r7, #16]
 588 02c6 0133     		adds	r3, r3, #1
 589 02c8 402B     		cmp	r3, #64
 590 02ca 01DD     		ble	.L42
 107:Z:/Moplaborationer/game\object.c **** 			return 1;
 591              		.loc 1 107 0
 592 02cc 0123     		movs	r3, #1
 593 02ce 37E0     		b	.L43
 594              	.L42:
 595              	.LBB9:
 108:Z:/Moplaborationer/game\object.c **** 		} else {
 109:Z:/Moplaborationer/game\object.c **** 			for (int i=0; i<4; i++) {
 596              		.loc 1 109 0
 597 02d0 0023     		movs	r3, #0
 598 02d2 FB61     		str	r3, [r7, #28]
 599 02d4 0FE0     		b	.L44
 600              	.L46:
 110:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin+i, ymax+1)) {
 601              		.loc 1 110 0
 602 02d6 FA68     		ldr	r2, [r7, #12]
 603 02d8 FB69     		ldr	r3, [r7, #28]
 604 02da D218     		adds	r2, r2, r3
 605 02dc 3B69     		ldr	r3, [r7, #16]
 606 02de 0133     		adds	r3, r3, #1
 607 02e0 1900     		movs	r1, r3
 608 02e2 1000     		movs	r0, r2
 609 02e4 FFF7FEFF 		bl	read_pixel
 610 02e8 031E     		subs	r3, r0, #0
 611 02ea 01D0     		beq	.L45
 111:Z:/Moplaborationer/game\object.c **** 					return 1;
 612              		.loc 1 111 0
 613 02ec 0123     		movs	r3, #1
 614 02ee 27E0     		b	.L43
 615              	.L45:
 109:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin+i, ymax+1)) {
 616              		.loc 1 109 0 discriminator 2
 617 02f0 FB69     		ldr	r3, [r7, #28]
 618 02f2 0133     		adds	r3, r3, #1
 619 02f4 FB61     		str	r3, [r7, #28]
 620              	.L44:
 109:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin+i, ymax+1)) {
 621              		.loc 1 109 0 is_stmt 0 discriminator 1
 622 02f6 FB69     		ldr	r3, [r7, #28]
 623 02f8 032B     		cmp	r3, #3
 624 02fa ECDD     		ble	.L46
 625 02fc 1FE0     		b	.L47
 626              	.L41:
 627              	.LBE9:
 112:Z:/Moplaborationer/game\object.c **** 				}
 113:Z:/Moplaborationer/game\object.c **** 			}
 114:Z:/Moplaborationer/game\object.c **** 		}
 115:Z:/Moplaborationer/game\object.c **** 	} else if (o->diry < 0) {				// if moving up
 628              		.loc 1 115 0 is_stmt 1
 629 02fe 7B68     		ldr	r3, [r7, #4]
 630 0300 9B68     		ldr	r3, [r3, #8]
 631 0302 002B     		cmp	r3, #0
 632 0304 1BDA     		bge	.L47
 116:Z:/Moplaborationer/game\object.c **** 		if ( (ymin - 1) < 1 ) {
 633              		.loc 1 116 0
 634 0306 7B69     		ldr	r3, [r7, #20]
 635 0308 013B     		subs	r3, r3, #1
 636 030a 002B     		cmp	r3, #0
 637 030c 01DC     		bgt	.L48
 117:Z:/Moplaborationer/game\object.c **** 			return 1;
 638              		.loc 1 117 0
 639 030e 0123     		movs	r3, #1
 640 0310 16E0     		b	.L43
 641              	.L48:
 642              	.LBB10:
 118:Z:/Moplaborationer/game\object.c **** 		} else {
 119:Z:/Moplaborationer/game\object.c **** 			for (int i=0; i<4; i++) {
 643              		.loc 1 119 0
 644 0312 0023     		movs	r3, #0
 645 0314 BB61     		str	r3, [r7, #24]
 646 0316 0FE0     		b	.L49
 647              	.L51:
 120:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin+i, ymin-1)) {
 648              		.loc 1 120 0
 649 0318 FA68     		ldr	r2, [r7, #12]
 650 031a BB69     		ldr	r3, [r7, #24]
 651 031c D218     		adds	r2, r2, r3
 652 031e 7B69     		ldr	r3, [r7, #20]
 653 0320 013B     		subs	r3, r3, #1
 654 0322 1900     		movs	r1, r3
 655 0324 1000     		movs	r0, r2
 656 0326 FFF7FEFF 		bl	read_pixel
 657 032a 031E     		subs	r3, r0, #0
 658 032c 01D0     		beq	.L50
 121:Z:/Moplaborationer/game\object.c **** 					return 1;
 659              		.loc 1 121 0
 660 032e 0123     		movs	r3, #1
 661 0330 06E0     		b	.L43
 662              	.L50:
 119:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin+i, ymin-1)) {
 663              		.loc 1 119 0 discriminator 2
 664 0332 BB69     		ldr	r3, [r7, #24]
 665 0334 0133     		adds	r3, r3, #1
 666 0336 BB61     		str	r3, [r7, #24]
 667              	.L49:
 119:Z:/Moplaborationer/game\object.c **** 				if(read_pixel(xmin+i, ymin-1)) {
 668              		.loc 1 119 0 is_stmt 0 discriminator 1
 669 0338 BB69     		ldr	r3, [r7, #24]
 670 033a 032B     		cmp	r3, #3
 671 033c ECDD     		ble	.L51
 672              	.L47:
 673              	.LBE10:
 122:Z:/Moplaborationer/game\object.c **** 				}
 123:Z:/Moplaborationer/game\object.c **** 			}
 124:Z:/Moplaborationer/game\object.c **** 		}
 125:Z:/Moplaborationer/game\object.c **** 	}
 126:Z:/Moplaborationer/game\object.c **** 	return 0;
 674              		.loc 1 126 0 is_stmt 1
 675 033e 0023     		movs	r3, #0
 676              	.L43:
 127:Z:/Moplaborationer/game\object.c **** }
 677              		.loc 1 127 0
 678 0340 1800     		movs	r0, r3
 679 0342 BD46     		mov	sp, r7
 680 0344 08B0     		add	sp, sp, #32
 681              		@ sp needed
 682 0346 80BD     		pop	{r7, pc}
 683              		.cfi_endproc
 684              	.LFE4:
 686              		.align	1
 687              		.syntax unified
 688              		.code	16
 689              		.thumb_func
 690              		.fpu softvfp
 692              	move_player:
 693              	.LFB5:
 128:Z:/Moplaborationer/game\object.c **** 
 129:Z:/Moplaborationer/game\object.c **** static void move_player(POBJECT o){
 694              		.loc 1 129 0
 695              		.cfi_startproc
 696              		@ args = 0, pretend = 0, frame = 24
 697              		@ frame_needed = 1, uses_anonymous_args = 0
 698 0348 90B5     		push	{r4, r7, lr}
 699              		.cfi_def_cfa_offset 12
 700              		.cfi_offset 4, -12
 701              		.cfi_offset 7, -8
 702              		.cfi_offset 14, -4
 703 034a 87B0     		sub	sp, sp, #28
 704              		.cfi_def_cfa_offset 40
 705 034c 00AF     		add	r7, sp, #0
 706              		.cfi_def_cfa_register 7
 707 034e 7860     		str	r0, [r7, #4]
 130:Z:/Moplaborationer/game\object.c **** 	int xsteps = abs(o->dirx);
 708              		.loc 1 130 0
 709 0350 7B68     		ldr	r3, [r7, #4]
 710 0352 5B68     		ldr	r3, [r3, #4]
 711 0354 DA17     		asrs	r2, r3, #31
 712 0356 9B18     		adds	r3, r3, r2
 713 0358 5340     		eors	r3, r2
 714 035a FB60     		str	r3, [r7, #12]
 131:Z:/Moplaborationer/game\object.c **** 	int ysteps = abs(o->diry);
 715              		.loc 1 131 0
 716 035c 7B68     		ldr	r3, [r7, #4]
 717 035e 9B68     		ldr	r3, [r3, #8]
 718 0360 DA17     		asrs	r2, r3, #31
 719 0362 9B18     		adds	r3, r3, r2
 720 0364 5340     		eors	r3, r2
 721 0366 BB60     		str	r3, [r7, #8]
 722              	.LBB11:
 132:Z:/Moplaborationer/game\object.c **** 	
 133:Z:/Moplaborationer/game\object.c **** 	for(int i = 0; i < xsteps; i++)
 723              		.loc 1 133 0
 724 0368 0023     		movs	r3, #0
 725 036a 7B61     		str	r3, [r7, #20]
 726 036c 35E0     		b	.L53
 727              	.L59:
 134:Z:/Moplaborationer/game\object.c **** 	{
 135:Z:/Moplaborationer/game\object.c **** 		if(xcheckDotCollision(o)) {
 728              		.loc 1 135 0
 729 036e 7B68     		ldr	r3, [r7, #4]
 730 0370 1800     		movs	r0, r3
 731 0372 FFF772FE 		bl	xcheckDotCollision
 732 0376 031E     		subs	r3, r0, #0
 733 0378 0AD0     		beq	.L54
 136:Z:/Moplaborationer/game\object.c **** 			o->score++;
 734              		.loc 1 136 0
 735 037a 7B68     		ldr	r3, [r7, #4]
 736 037c 9B69     		ldr	r3, [r3, #24]
 737 037e 5A1C     		adds	r2, r3, #1
 738 0380 7B68     		ldr	r3, [r7, #4]
 739 0382 9A61     		str	r2, [r3, #24]
 137:Z:/Moplaborationer/game\object.c **** 			chooseDot(rand());
 740              		.loc 1 137 0
 741 0384 FFF7FEFF 		bl	rand
 742 0388 0300     		movs	r3, r0
 743 038a 1800     		movs	r0, r3
 744 038c FFF7FEFF 		bl	chooseDot
 745              	.L54:
 138:Z:/Moplaborationer/game\object.c **** 		}
 139:Z:/Moplaborationer/game\object.c **** 		if (xcheckCollison(o)) {
 746              		.loc 1 139 0
 747 0390 7B68     		ldr	r3, [r7, #4]
 748 0392 1800     		movs	r0, r3
 749 0394 FFF7FEFF 		bl	xcheckCollison
 750 0398 031E     		subs	r3, r0, #0
 751 039a 08D0     		beq	.L55
 140:Z:/Moplaborationer/game\object.c **** 			o->set_speed(o, 0, o->diry);
 752              		.loc 1 140 0
 753 039c 7B68     		ldr	r3, [r7, #4]
 754 039e 9C6A     		ldr	r4, [r3, #40]
 755 03a0 7B68     		ldr	r3, [r7, #4]
 756 03a2 9A68     		ldr	r2, [r3, #8]
 757 03a4 7B68     		ldr	r3, [r7, #4]
 758 03a6 0021     		movs	r1, #0
 759 03a8 1800     		movs	r0, r3
 760 03aa A047     		blx	r4
 761              	.LVL0:
 141:Z:/Moplaborationer/game\object.c **** 			break;
 762              		.loc 1 141 0
 763 03ac 19E0     		b	.L56
 764              	.L55:
 142:Z:/Moplaborationer/game\object.c **** 		}
 143:Z:/Moplaborationer/game\object.c **** 		
 144:Z:/Moplaborationer/game\object.c **** 		if (o->dirx > 0)
 765              		.loc 1 144 0
 766 03ae 7B68     		ldr	r3, [r7, #4]
 767 03b0 5B68     		ldr	r3, [r3, #4]
 768 03b2 002B     		cmp	r3, #0
 769 03b4 05DD     		ble	.L57
 145:Z:/Moplaborationer/game\object.c **** 			o->posx++;
 770              		.loc 1 145 0
 771 03b6 7B68     		ldr	r3, [r7, #4]
 772 03b8 DB68     		ldr	r3, [r3, #12]
 773 03ba 5A1C     		adds	r2, r3, #1
 774 03bc 7B68     		ldr	r3, [r7, #4]
 775 03be DA60     		str	r2, [r3, #12]
 776 03c0 08E0     		b	.L58
 777              	.L57:
 146:Z:/Moplaborationer/game\object.c **** 		else if (o->dirx < 0)
 778              		.loc 1 146 0
 779 03c2 7B68     		ldr	r3, [r7, #4]
 780 03c4 5B68     		ldr	r3, [r3, #4]
 781 03c6 002B     		cmp	r3, #0
 782 03c8 04DA     		bge	.L58
 147:Z:/Moplaborationer/game\object.c **** 			o->posx--;
 783              		.loc 1 147 0
 784 03ca 7B68     		ldr	r3, [r7, #4]
 785 03cc DB68     		ldr	r3, [r3, #12]
 786 03ce 5A1E     		subs	r2, r3, #1
 787 03d0 7B68     		ldr	r3, [r7, #4]
 788 03d2 DA60     		str	r2, [r3, #12]
 789              	.L58:
 133:Z:/Moplaborationer/game\object.c **** 	{
 790              		.loc 1 133 0 discriminator 2
 791 03d4 7B69     		ldr	r3, [r7, #20]
 792 03d6 0133     		adds	r3, r3, #1
 793 03d8 7B61     		str	r3, [r7, #20]
 794              	.L53:
 133:Z:/Moplaborationer/game\object.c **** 	{
 795              		.loc 1 133 0 is_stmt 0 discriminator 1
 796 03da 7A69     		ldr	r2, [r7, #20]
 797 03dc FB68     		ldr	r3, [r7, #12]
 798 03de 9A42     		cmp	r2, r3
 799 03e0 C5DB     		blt	.L59
 800              	.L56:
 801              	.LBE11:
 802              	.LBB12:
 148:Z:/Moplaborationer/game\object.c **** 	}
 149:Z:/Moplaborationer/game\object.c **** 	
 150:Z:/Moplaborationer/game\object.c **** 	for(int i = 0; i < ysteps; i++)
 803              		.loc 1 150 0 is_stmt 1
 804 03e2 0023     		movs	r3, #0
 805 03e4 3B61     		str	r3, [r7, #16]
 806 03e6 35E0     		b	.L60
 807              	.L66:
 151:Z:/Moplaborationer/game\object.c **** 	{
 152:Z:/Moplaborationer/game\object.c **** 		if(ycheckDotCollision(o)) {
 808              		.loc 1 152 0
 809 03e8 7B68     		ldr	r3, [r7, #4]
 810 03ea 1800     		movs	r0, r3
 811 03ec FFF79AFE 		bl	ycheckDotCollision
 812 03f0 031E     		subs	r3, r0, #0
 813 03f2 0AD0     		beq	.L61
 153:Z:/Moplaborationer/game\object.c **** 			o->score++;
 814              		.loc 1 153 0
 815 03f4 7B68     		ldr	r3, [r7, #4]
 816 03f6 9B69     		ldr	r3, [r3, #24]
 817 03f8 5A1C     		adds	r2, r3, #1
 818 03fa 7B68     		ldr	r3, [r7, #4]
 819 03fc 9A61     		str	r2, [r3, #24]
 154:Z:/Moplaborationer/game\object.c **** 			chooseDot(rand());
 820              		.loc 1 154 0
 821 03fe FFF7FEFF 		bl	rand
 822 0402 0300     		movs	r3, r0
 823 0404 1800     		movs	r0, r3
 824 0406 FFF7FEFF 		bl	chooseDot
 825              	.L61:
 155:Z:/Moplaborationer/game\object.c **** 		}
 156:Z:/Moplaborationer/game\object.c **** 		if (ycheckCollison(o)) {
 826              		.loc 1 156 0
 827 040a 7B68     		ldr	r3, [r7, #4]
 828 040c 1800     		movs	r0, r3
 829 040e FFF7FEFF 		bl	ycheckCollison
 830 0412 031E     		subs	r3, r0, #0
 831 0414 08D0     		beq	.L62
 157:Z:/Moplaborationer/game\object.c **** 			o->set_speed(o, o->dirx, 0);
 832              		.loc 1 157 0
 833 0416 7B68     		ldr	r3, [r7, #4]
 834 0418 9C6A     		ldr	r4, [r3, #40]
 835 041a 7B68     		ldr	r3, [r7, #4]
 836 041c 5968     		ldr	r1, [r3, #4]
 837 041e 7B68     		ldr	r3, [r7, #4]
 838 0420 0022     		movs	r2, #0
 839 0422 1800     		movs	r0, r3
 840 0424 A047     		blx	r4
 841              	.LVL1:
 158:Z:/Moplaborationer/game\object.c **** 			break;
 842              		.loc 1 158 0
 843 0426 19E0     		b	.L63
 844              	.L62:
 159:Z:/Moplaborationer/game\object.c **** 		}
 160:Z:/Moplaborationer/game\object.c **** 		
 161:Z:/Moplaborationer/game\object.c **** 		if (o->diry > 0)
 845              		.loc 1 161 0
 846 0428 7B68     		ldr	r3, [r7, #4]
 847 042a 9B68     		ldr	r3, [r3, #8]
 848 042c 002B     		cmp	r3, #0
 849 042e 05DD     		ble	.L64
 162:Z:/Moplaborationer/game\object.c **** 			o->posy++;
 850              		.loc 1 162 0
 851 0430 7B68     		ldr	r3, [r7, #4]
 852 0432 1B69     		ldr	r3, [r3, #16]
 853 0434 5A1C     		adds	r2, r3, #1
 854 0436 7B68     		ldr	r3, [r7, #4]
 855 0438 1A61     		str	r2, [r3, #16]
 856 043a 08E0     		b	.L65
 857              	.L64:
 163:Z:/Moplaborationer/game\object.c **** 		else if (o->diry < 0)
 858              		.loc 1 163 0
 859 043c 7B68     		ldr	r3, [r7, #4]
 860 043e 9B68     		ldr	r3, [r3, #8]
 861 0440 002B     		cmp	r3, #0
 862 0442 04DA     		bge	.L65
 164:Z:/Moplaborationer/game\object.c **** 			o->posy--;
 863              		.loc 1 164 0
 864 0444 7B68     		ldr	r3, [r7, #4]
 865 0446 1B69     		ldr	r3, [r3, #16]
 866 0448 5A1E     		subs	r2, r3, #1
 867 044a 7B68     		ldr	r3, [r7, #4]
 868 044c 1A61     		str	r2, [r3, #16]
 869              	.L65:
 150:Z:/Moplaborationer/game\object.c **** 	{
 870              		.loc 1 150 0 discriminator 2
 871 044e 3B69     		ldr	r3, [r7, #16]
 872 0450 0133     		adds	r3, r3, #1
 873 0452 3B61     		str	r3, [r7, #16]
 874              	.L60:
 150:Z:/Moplaborationer/game\object.c **** 	{
 875              		.loc 1 150 0 is_stmt 0 discriminator 1
 876 0454 3A69     		ldr	r2, [r7, #16]
 877 0456 BB68     		ldr	r3, [r7, #8]
 878 0458 9A42     		cmp	r2, r3
 879 045a C5DB     		blt	.L66
 880              	.L63:
 881              	.LBE12:
 165:Z:/Moplaborationer/game\object.c **** 	}
 166:Z:/Moplaborationer/game\object.c **** 	
 167:Z:/Moplaborationer/game\object.c **** }
 882              		.loc 1 167 0 is_stmt 1
 883 045c C046     		nop
 884 045e BD46     		mov	sp, r7
 885 0460 07B0     		add	sp, sp, #28
 886              		@ sp needed
 887 0462 90BD     		pop	{r4, r7, pc}
 888              		.cfi_endproc
 889              	.LFE5:
 891              		.align	1
 892              		.syntax unified
 893              		.code	16
 894              		.thumb_func
 895              		.fpu softvfp
 897              	set_object_speed:
 898              	.LFB6:
 168:Z:/Moplaborationer/game\object.c **** 
 169:Z:/Moplaborationer/game\object.c **** 
 170:Z:/Moplaborationer/game\object.c **** 
 171:Z:/Moplaborationer/game\object.c **** 
 172:Z:/Moplaborationer/game\object.c **** static void set_object_speed(POBJECT o, int dirx, int diry){
 899              		.loc 1 172 0
 900              		.cfi_startproc
 901              		@ args = 0, pretend = 0, frame = 16
 902              		@ frame_needed = 1, uses_anonymous_args = 0
 903 0464 80B5     		push	{r7, lr}
 904              		.cfi_def_cfa_offset 8
 905              		.cfi_offset 7, -8
 906              		.cfi_offset 14, -4
 907 0466 84B0     		sub	sp, sp, #16
 908              		.cfi_def_cfa_offset 24
 909 0468 00AF     		add	r7, sp, #0
 910              		.cfi_def_cfa_register 7
 911 046a F860     		str	r0, [r7, #12]
 912 046c B960     		str	r1, [r7, #8]
 913 046e 7A60     		str	r2, [r7, #4]
 173:Z:/Moplaborationer/game\object.c **** 	o->dirx = dirx;
 914              		.loc 1 173 0
 915 0470 FB68     		ldr	r3, [r7, #12]
 916 0472 BA68     		ldr	r2, [r7, #8]
 917 0474 5A60     		str	r2, [r3, #4]
 174:Z:/Moplaborationer/game\object.c **** 	o->diry = diry;
 918              		.loc 1 174 0
 919 0476 FB68     		ldr	r3, [r7, #12]
 920 0478 7A68     		ldr	r2, [r7, #4]
 921 047a 9A60     		str	r2, [r3, #8]
 175:Z:/Moplaborationer/game\object.c **** }
 922              		.loc 1 175 0
 923 047c C046     		nop
 924 047e BD46     		mov	sp, r7
 925 0480 04B0     		add	sp, sp, #16
 926              		@ sp needed
 927 0482 80BD     		pop	{r7, pc}
 928              		.cfi_endproc
 929              	.LFE6:
 931              		.align	1
 932              		.global	draw_objectSim
 933              		.syntax unified
 934              		.code	16
 935              		.thumb_func
 936              		.fpu softvfp
 938              	draw_objectSim:
 939              	.LFB7:
 176:Z:/Moplaborationer/game\object.c **** 
 177:Z:/Moplaborationer/game\object.c **** /*---------------------SIM------------------------*/
 178:Z:/Moplaborationer/game\object.c **** void draw_objectSim(POBJECT o){				// SIMULATOR
 940              		.loc 1 178 0
 941              		.cfi_startproc
 942              		@ args = 0, pretend = 0, frame = 16
 943              		@ frame_needed = 1, uses_anonymous_args = 0
 944 0484 80B5     		push	{r7, lr}
 945              		.cfi_def_cfa_offset 8
 946              		.cfi_offset 7, -8
 947              		.cfi_offset 14, -4
 948 0486 84B0     		sub	sp, sp, #16
 949              		.cfi_def_cfa_offset 24
 950 0488 00AF     		add	r7, sp, #0
 951              		.cfi_def_cfa_register 7
 952 048a 7860     		str	r0, [r7, #4]
 953              	.LBB13:
 179:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
 954              		.loc 1 179 0
 955 048c 0023     		movs	r3, #0
 956 048e FB60     		str	r3, [r7, #12]
 957 0490 1CE0     		b	.L69
 958              	.L70:
 180:Z:/Moplaborationer/game\object.c **** 		pixelSim(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 1);
 959              		.loc 1 180 0 discriminator 3
 960 0492 7B68     		ldr	r3, [r7, #4]
 961 0494 DA68     		ldr	r2, [r3, #12]
 962 0496 7B68     		ldr	r3, [r7, #4]
 963 0498 1968     		ldr	r1, [r3]
 964 049a FB68     		ldr	r3, [r7, #12]
 965 049c 0433     		adds	r3, r3, #4
 966 049e 5B00     		lsls	r3, r3, #1
 967 04a0 CB18     		adds	r3, r1, r3
 968 04a2 0433     		adds	r3, r3, #4
 969 04a4 1B78     		ldrb	r3, [r3]
 970 04a6 D018     		adds	r0, r2, r3
 971 04a8 7B68     		ldr	r3, [r7, #4]
 972 04aa 1A69     		ldr	r2, [r3, #16]
 973 04ac 7B68     		ldr	r3, [r7, #4]
 974 04ae 1968     		ldr	r1, [r3]
 975 04b0 FB68     		ldr	r3, [r7, #12]
 976 04b2 0433     		adds	r3, r3, #4
 977 04b4 5B00     		lsls	r3, r3, #1
 978 04b6 CB18     		adds	r3, r1, r3
 979 04b8 0533     		adds	r3, r3, #5
 980 04ba 1B78     		ldrb	r3, [r3]
 981 04bc D318     		adds	r3, r2, r3
 982 04be 0122     		movs	r2, #1
 983 04c0 1900     		movs	r1, r3
 984 04c2 FFF7FEFF 		bl	pixelSim
 179:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
 985              		.loc 1 179 0 discriminator 3
 986 04c6 FB68     		ldr	r3, [r7, #12]
 987 04c8 0133     		adds	r3, r3, #1
 988 04ca FB60     		str	r3, [r7, #12]
 989              	.L69:
 179:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
 990              		.loc 1 179 0 is_stmt 0 discriminator 1
 991 04cc 7B68     		ldr	r3, [r7, #4]
 992 04ce 1B68     		ldr	r3, [r3]
 993 04d0 1A68     		ldr	r2, [r3]
 994 04d2 FB68     		ldr	r3, [r7, #12]
 995 04d4 9A42     		cmp	r2, r3
 996 04d6 DCDC     		bgt	.L70
 997              	.LBE13:
 181:Z:/Moplaborationer/game\object.c **** 	}
 182:Z:/Moplaborationer/game\object.c **** }
 998              		.loc 1 182 0 is_stmt 1
 999 04d8 C046     		nop
 1000 04da BD46     		mov	sp, r7
 1001 04dc 04B0     		add	sp, sp, #16
 1002              		@ sp needed
 1003 04de 80BD     		pop	{r7, pc}
 1004              		.cfi_endproc
 1005              	.LFE7:
 1007              		.align	1
 1008              		.syntax unified
 1009              		.code	16
 1010              		.thumb_func
 1011              		.fpu softvfp
 1013              	clear_objectSim:
 1014              	.LFB8:
 183:Z:/Moplaborationer/game\object.c **** 
 184:Z:/Moplaborationer/game\object.c **** static void clear_objectSim(POBJECT o){		// SIMULATOR
 1015              		.loc 1 184 0
 1016              		.cfi_startproc
 1017              		@ args = 0, pretend = 0, frame = 16
 1018              		@ frame_needed = 1, uses_anonymous_args = 0
 1019 04e0 80B5     		push	{r7, lr}
 1020              		.cfi_def_cfa_offset 8
 1021              		.cfi_offset 7, -8
 1022              		.cfi_offset 14, -4
 1023 04e2 84B0     		sub	sp, sp, #16
 1024              		.cfi_def_cfa_offset 24
 1025 04e4 00AF     		add	r7, sp, #0
 1026              		.cfi_def_cfa_register 7
 1027 04e6 7860     		str	r0, [r7, #4]
 1028              	.LBB14:
 185:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
 1029              		.loc 1 185 0
 1030 04e8 0023     		movs	r3, #0
 1031 04ea FB60     		str	r3, [r7, #12]
 1032 04ec 1CE0     		b	.L72
 1033              	.L73:
 186:Z:/Moplaborationer/game\object.c **** 		pixelSim(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 0);
 1034              		.loc 1 186 0 discriminator 3
 1035 04ee 7B68     		ldr	r3, [r7, #4]
 1036 04f0 DA68     		ldr	r2, [r3, #12]
 1037 04f2 7B68     		ldr	r3, [r7, #4]
 1038 04f4 1968     		ldr	r1, [r3]
 1039 04f6 FB68     		ldr	r3, [r7, #12]
 1040 04f8 0433     		adds	r3, r3, #4
 1041 04fa 5B00     		lsls	r3, r3, #1
 1042 04fc CB18     		adds	r3, r1, r3
 1043 04fe 0433     		adds	r3, r3, #4
 1044 0500 1B78     		ldrb	r3, [r3]
 1045 0502 D018     		adds	r0, r2, r3
 1046 0504 7B68     		ldr	r3, [r7, #4]
 1047 0506 1A69     		ldr	r2, [r3, #16]
 1048 0508 7B68     		ldr	r3, [r7, #4]
 1049 050a 1968     		ldr	r1, [r3]
 1050 050c FB68     		ldr	r3, [r7, #12]
 1051 050e 0433     		adds	r3, r3, #4
 1052 0510 5B00     		lsls	r3, r3, #1
 1053 0512 CB18     		adds	r3, r1, r3
 1054 0514 0533     		adds	r3, r3, #5
 1055 0516 1B78     		ldrb	r3, [r3]
 1056 0518 D318     		adds	r3, r2, r3
 1057 051a 0022     		movs	r2, #0
 1058 051c 1900     		movs	r1, r3
 1059 051e FFF7FEFF 		bl	pixelSim
 185:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
 1060              		.loc 1 185 0 discriminator 3
 1061 0522 FB68     		ldr	r3, [r7, #12]
 1062 0524 0133     		adds	r3, r3, #1
 1063 0526 FB60     		str	r3, [r7, #12]
 1064              	.L72:
 185:Z:/Moplaborationer/game\object.c **** 	for(int i=0; i < o->geo->numpoints; i++){
 1065              		.loc 1 185 0 is_stmt 0 discriminator 1
 1066 0528 7B68     		ldr	r3, [r7, #4]
 1067 052a 1B68     		ldr	r3, [r3]
 1068 052c 1A68     		ldr	r2, [r3]
 1069 052e FB68     		ldr	r3, [r7, #12]
 1070 0530 9A42     		cmp	r2, r3
 1071 0532 DCDC     		bgt	.L73
 1072              	.LBE14:
 187:Z:/Moplaborationer/game\object.c **** 	}
 188:Z:/Moplaborationer/game\object.c **** }
 1073              		.loc 1 188 0 is_stmt 1
 1074 0534 C046     		nop
 1075 0536 BD46     		mov	sp, r7
 1076 0538 04B0     		add	sp, sp, #16
 1077              		@ sp needed
 1078 053a 80BD     		pop	{r7, pc}
 1079              		.cfi_endproc
 1080              	.LFE8:
 1082              		.data
 1083              		.align	2
 1086              	ball_geometry0:
 1087 0000 19000000 		.word	25
 1088 0004 05000000 		.word	5
 1089 0008 05000000 		.word	5
 1090 000c 00       		.byte	0
 1091 000d 00       		.byte	0
 1092 000e 01       		.byte	1
 1093 000f 00       		.byte	0
 1094 0010 02       		.byte	2
 1095 0011 00       		.byte	0
 1096 0012 03       		.byte	3
 1097 0013 00       		.byte	0
 1098 0014 04       		.byte	4
 1099 0015 00       		.byte	0
 1100 0016 00       		.byte	0
 1101 0017 01       		.byte	1
 1102 0018 01       		.byte	1
 1103 0019 01       		.byte	1
 1104 001a 02       		.byte	2
 1105 001b 01       		.byte	1
 1106 001c 03       		.byte	3
 1107 001d 01       		.byte	1
 1108 001e 04       		.byte	4
 1109 001f 01       		.byte	1
 1110 0020 00       		.byte	0
 1111 0021 02       		.byte	2
 1112 0022 01       		.byte	1
 1113 0023 02       		.byte	2
 1114 0024 02       		.byte	2
 1115 0025 02       		.byte	2
 1116 0026 03       		.byte	3
 1117 0027 02       		.byte	2
 1118 0028 04       		.byte	4
 1119 0029 02       		.byte	2
 1120 002a 00       		.byte	0
 1121 002b 03       		.byte	3
 1122 002c 01       		.byte	1
 1123 002d 03       		.byte	3
 1124 002e 02       		.byte	2
 1125 002f 03       		.byte	3
 1126 0030 03       		.byte	3
 1127 0031 03       		.byte	3
 1128 0032 04       		.byte	4
 1129 0033 03       		.byte	3
 1130 0034 00       		.byte	0
 1131 0035 04       		.byte	4
 1132 0036 01       		.byte	1
 1133 0037 04       		.byte	4
 1134 0038 02       		.byte	2
 1135 0039 04       		.byte	4
 1136 003a 03       		.byte	3
 1137 003b 04       		.byte	4
 1138 003c 04       		.byte	4
 1139 003d 04       		.byte	4
 1140 003e 0000     		.space	2
 1141              		.align	2
 1144              	ball_geometry1:
 1145 0040 15000000 		.word	21
 1146 0044 05000000 		.word	5
 1147 0048 05000000 		.word	5
 1148 004c 01       		.byte	1
 1149 004d 00       		.byte	0
 1150 004e 02       		.byte	2
 1151 004f 00       		.byte	0
 1152 0050 03       		.byte	3
 1153 0051 00       		.byte	0
 1154 0052 00       		.byte	0
 1155 0053 01       		.byte	1
 1156 0054 01       		.byte	1
 1157 0055 01       		.byte	1
 1158 0056 02       		.byte	2
 1159 0057 01       		.byte	1
 1160 0058 03       		.byte	3
 1161 0059 01       		.byte	1
 1162 005a 04       		.byte	4
 1163 005b 01       		.byte	1
 1164 005c 00       		.byte	0
 1165 005d 02       		.byte	2
 1166 005e 01       		.byte	1
 1167 005f 02       		.byte	2
 1168 0060 02       		.byte	2
 1169 0061 02       		.byte	2
 1170 0062 03       		.byte	3
 1171 0063 02       		.byte	2
 1172 0064 04       		.byte	4
 1173 0065 02       		.byte	2
 1174 0066 00       		.byte	0
 1175 0067 03       		.byte	3
 1176 0068 01       		.byte	1
 1177 0069 03       		.byte	3
 1178 006a 02       		.byte	2
 1179 006b 03       		.byte	3
 1180 006c 03       		.byte	3
 1181 006d 03       		.byte	3
 1182 006e 04       		.byte	4
 1183 006f 03       		.byte	3
 1184 0070 01       		.byte	1
 1185 0071 04       		.byte	4
 1186 0072 02       		.byte	2
 1187 0073 04       		.byte	4
 1188 0074 03       		.byte	3
 1189 0075 04       		.byte	4
 1190 0076 00000000 		.space	8
 1190      00000000 
 1191 007e 0000     		.space	2
 1192              		.align	2
 1195              	ball_geometry2:
 1196 0080 10000000 		.word	16
 1197 0084 05000000 		.word	5
 1198 0088 05000000 		.word	5
 1199 008c 01       		.byte	1
 1200 008d 00       		.byte	0
 1201 008e 02       		.byte	2
 1202 008f 00       		.byte	0
 1203 0090 03       		.byte	3
 1204 0091 00       		.byte	0
 1205 0092 00       		.byte	0
 1206 0093 01       		.byte	1
 1207 0094 01       		.byte	1
 1208 0095 01       		.byte	1
 1209 0096 03       		.byte	3
 1210 0097 01       		.byte	1
 1211 0098 04       		.byte	4
 1212 0099 01       		.byte	1
 1213 009a 00       		.byte	0
 1214 009b 02       		.byte	2
 1215 009c 04       		.byte	4
 1216 009d 02       		.byte	2
 1217 009e 00       		.byte	0
 1218 009f 03       		.byte	3
 1219 00a0 01       		.byte	1
 1220 00a1 03       		.byte	3
 1221 00a2 03       		.byte	3
 1222 00a3 03       		.byte	3
 1223 00a4 04       		.byte	4
 1224 00a5 03       		.byte	3
 1225 00a6 01       		.byte	1
 1226 00a7 04       		.byte	4
 1227 00a8 02       		.byte	2
 1228 00a9 04       		.byte	4
 1229 00aa 03       		.byte	3
 1230 00ab 04       		.byte	4
 1231 00ac 00000000 		.space	18
 1231      00000000 
 1231      00000000 
 1231      00000000 
 1231      0000
 1232 00be 0000     		.space	2
 1233              		.align	2
 1236              	ball_geometry3:
 1237 00c0 0C000000 		.word	12
 1238 00c4 05000000 		.word	5
 1239 00c8 05000000 		.word	5
 1240 00cc 00       		.byte	0
 1241 00cd 00       		.byte	0
 1242 00ce 01       		.byte	1
 1243 00cf 00       		.byte	0
 1244 00d0 03       		.byte	3
 1245 00d1 00       		.byte	0
 1246 00d2 04       		.byte	4
 1247 00d3 00       		.byte	0
 1248 00d4 00       		.byte	0
 1249 00d5 01       		.byte	1
 1250 00d6 04       		.byte	4
 1251 00d7 01       		.byte	1
 1252 00d8 00       		.byte	0
 1253 00d9 03       		.byte	3
 1254 00da 04       		.byte	4
 1255 00db 03       		.byte	3
 1256 00dc 00       		.byte	0
 1257 00dd 04       		.byte	4
 1258 00de 01       		.byte	1
 1259 00df 04       		.byte	4
 1260 00e0 03       		.byte	3
 1261 00e1 04       		.byte	4
 1262 00e2 04       		.byte	4
 1263 00e3 04       		.byte	4
 1264 00e4 00000000 		.space	26
 1264      00000000 
 1264      00000000 
 1264      00000000 
 1264      00000000 
 1265 00fe 0000     		.space	2
 1266              		.align	2
 1269              	ball_geometry4:
 1270 0100 19000000 		.word	25
 1271 0104 05000000 		.word	5
 1272 0108 05000000 		.word	5
 1273 010c 02       		.byte	2
 1274 010d 00       		.byte	0
 1275 010e 03       		.byte	3
 1276 010f 00       		.byte	0
 1277 0110 00       		.byte	0
 1278 0111 01       		.byte	1
 1279 0112 01       		.byte	1
 1280 0113 01       		.byte	1
 1281 0114 02       		.byte	2
 1282 0115 01       		.byte	1
 1283 0116 03       		.byte	3
 1284 0117 01       		.byte	1
 1285 0118 00       		.byte	0
 1286 0119 02       		.byte	2
 1287 011a 01       		.byte	1
 1288 011b 02       		.byte	2
 1289 011c 02       		.byte	2
 1290 011d 02       		.byte	2
 1291 011e 03       		.byte	3
 1292 011f 02       		.byte	2
 1293 0120 04       		.byte	4
 1294 0121 02       		.byte	2
 1295 0122 01       		.byte	1
 1296 0123 03       		.byte	3
 1297 0124 02       		.byte	2
 1298 0125 03       		.byte	3
 1299 0126 03       		.byte	3
 1300 0127 03       		.byte	3
 1301 0128 04       		.byte	4
 1302 0129 03       		.byte	3
 1303 012a 01       		.byte	1
 1304 012b 04       		.byte	4
 1305 012c 02       		.byte	2
 1306 012d 04       		.byte	4
 1307 012e 00000000 		.space	16
 1307      00000000 
 1307      00000000 
 1307      00000000 
 1308 013e 0000     		.space	2
 1309              		.align	2
 1312              	ball_geometryAI:
 1313 0140 13000000 		.word	19
 1314 0144 05000000 		.word	5
 1315 0148 05000000 		.word	5
 1316 014c 01       		.byte	1
 1317 014d 00       		.byte	0
 1318 014e 02       		.byte	2
 1319 014f 00       		.byte	0
 1320 0150 03       		.byte	3
 1321 0151 00       		.byte	0
 1322 0152 00       		.byte	0
 1323 0153 01       		.byte	1
 1324 0154 02       		.byte	2
 1325 0155 01       		.byte	1
 1326 0156 04       		.byte	4
 1327 0157 01       		.byte	1
 1328 0158 00       		.byte	0
 1329 0159 02       		.byte	2
 1330 015a 01       		.byte	1
 1331 015b 02       		.byte	2
 1332 015c 02       		.byte	2
 1333 015d 02       		.byte	2
 1334 015e 03       		.byte	3
 1335 015f 02       		.byte	2
 1336 0160 04       		.byte	4
 1337 0161 02       		.byte	2
 1338 0162 00       		.byte	0
 1339 0163 03       		.byte	3
 1340 0164 01       		.byte	1
 1341 0165 03       		.byte	3
 1342 0166 02       		.byte	2
 1343 0167 03       		.byte	3
 1344 0168 03       		.byte	3
 1345 0169 03       		.byte	3
 1346 016a 04       		.byte	4
 1347 016b 03       		.byte	3
 1348 016c 00       		.byte	0
 1349 016d 04       		.byte	4
 1350 016e 02       		.byte	2
 1351 016f 04       		.byte	4
 1352 0170 04       		.byte	4
 1353 0171 04       		.byte	4
 1354 0172 00000000 		.space	12
 1354      00000000 
 1354      00000000 
 1355 017e 0000     		.space	2
 1356              		.global	player1Object
 1357              		.align	2
 1360              	player1Object:
 1361 0180 40000000 		.word	ball_geometry1
 1362 0184 00000000 		.word	0
 1363 0188 00000000 		.word	0
 1364 018c 02000000 		.word	2
 1365 0190 21000000 		.word	33
 1366 0194 04000000 		.word	4
 1367 0198 00000000 		.word	0
 1368 019c 00000000 		.word	draw_object
 1369 01a0 00000000 		.word	clear_objectSim
 1370 01a4 00000000 		.word	move_player
 1371 01a8 00000000 		.word	set_object_speed
 1372              		.global	player2Object
 1373              		.align	2
 1376              	player2Object:
 1377 01ac 00010000 		.word	ball_geometry4
 1378 01b0 00000000 		.word	0
 1379 01b4 00000000 		.word	0
 1380 01b8 7A000000 		.word	122
 1381 01bc 21000000 		.word	33
 1382 01c0 04000000 		.word	4
 1383 01c4 00000000 		.word	0
 1384 01c8 00000000 		.word	draw_object
 1385 01cc 00000000 		.word	clear_objectSim
 1386 01d0 00000000 		.word	move_player
 1387 01d4 00000000 		.word	set_object_speed
 1388              		.global	AI1Object
 1389              		.align	2
 1392              	AI1Object:
 1393 01d8 40010000 		.word	ball_geometryAI
 1394 01dc 00000000 		.word	0
 1395 01e0 00000000 		.word	0
 1396 01e4 3E000000 		.word	62
 1397 01e8 3A000000 		.word	58
 1398 01ec 01000000 		.word	1
 1399 01f0 00000000 		.word	0
 1400 01f4 00000000 		.word	draw_object
 1401 01f8 00000000 		.word	clear_objectSim
 1402 01fc 00000000 		.word	move_AI
 1403 0200 00000000 		.word	set_object_speed
 1404              		.text
 1405              	.Letext0:
 1406              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 1407              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 1408              		.file 4 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\6.3.1\\include\\stddef.h"
 1409              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
 1410              		.file 6 "Z:/Moplaborationer/game/types.h"
 1411              		.file 7 "Z:/Moplaborationer/game/graphicdisplay.h"
 1412              		.file 8 "Z:/Moplaborationer/game/object.h"
 1413              		.file 9 "Z:/Moplaborationer/game/AI.h"
 1414              		.file 10 "<built-in>"
