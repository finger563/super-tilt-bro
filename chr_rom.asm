* = 0 ; We just use * to count position in the CHR-rom, begin with zero is easy

; TILE $00 - idle sinbad head
;
; 01111110
; 12222221
; 11211221
; 12222221
; 12112211
; 01222110
; 00111210
; 01222210
.byt %01111110, %10000001, %11011001, %10000001, %10110011, %01000110, %00111010, %01000010 
.byt %00000000, %01111110, %00100110, %01111110, %01001100, %00111000, %00000100, %00111100 

; TILE $01 - idle sinbad body
;
; 12222221
; 12222121
; 12222111
; 01333310
; 01313310
; 01313310
; 01313310
; 00101100
.byt %10000001, %10000101, %10000111, %01111110, %01111110, %01111110, %01111110, %00101100 
.byt %01111110, %01111010, %01111000, %00111100, %00101100, %00101100, %00101100, %00000000 

; TILE $02 - scimitar blade
;
; 01000010
; 12111121
; 01222222
; 00122222
; 00011222
; 00000111
; 00000000
; 00000000
.byt %01000010, %10111101, %01000000, %00100000, %00011000, %00000111, %00000000, %00000000 
.byt %00000000, %01000010, %00111111, %00011111, %00000111, %00000000, %00000000, %00000000 

; TILE $03 - scimitar handle
;
; 00000000
; 00010000
; 11131000
; 22230000
; 21130000
; 10010000
; 00000000
; 00000000
.byt %00000000, %00010000, %11111000, %00010000, %01110000, %10010000, %00000000, %00000000 
.byt %00000000, %00000000, %00010000, %11110000, %10010000, %00000000, %00000000, %00000000 

; TILE $04 to $07 - Running Sinbad 1
;
; Full picture layout
; $04 $05
; $06 $07

.byt %00011110, %01100010, %10000001, %10110001, %01000001, %01110011, %00111100, %00011000
.byt %00000000, %00011100, %01111110, %01001110, %00111110, %00001100, %00000011, %00000111

.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %10000000, %10000000
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %00010000, %00011110, %00010000, %00001111, %00011111, %00001111, %00000111, %00000000
.byt %00001111, %00000001, %00001111, %00000001, %00001110, %00000111, %00000000, %00000000

.byt %01000000, %01000000, %01000000, %11100000, %11110000, %11111000, %11111100, %00111100
.byt %10000000, %10000000, %10000000, %11000000, %01100000, %10110000, %00111000, %00000000

; TILE $08 to $0a - Running Sinbad 2
;
; Full picture layout
; $08 $05
; $09 $0a

.byt %00011110, %01100010, %10000001, %10110001, %01000001, %01110011, %00111100, %00010000
.byt %00000000, %00011100, %01111110, %01001110, %00111110, %00001100, %00000011, %00001111

.byt %00010000, %00010010, %00010001, %00001111, %00011111, %00111100, %00111100, %00111000
.byt %00001111, %00001101, %00001110, %00000111, %00001100, %00011000, %00011000, %00000000

.byt %01000000, %11000000, %11000000, %11100000, %11111000, %11111000, %01110000, %00000000
.byt %10000000, %00000000, %00000000, %11000000, %11100000, %01110000, %00000000, %00000000

; TILE $0b to $0c - Running Sinbad 3
;
; Full picture layout
; $08 $05
; $0b $0c

.byt %00010100, %00011010, %00011100, %00001111, %00011111, %00011111, %00011110, %00001100
.byt %00001011, %00000101, %00000011, %00000111, %00001101, %00001100, %00001100, %00000000

.byt %01000000, %01000000, %11000000, %10000000, %11100000, %11110000, %11100000, %00000000
.byt %10000000, %10000000, %00000000, %00000000, %10000000, %11100000, %00000000, %00000000

; TILE $0d - Solid 1
;
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111

.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

; TILE $0e - Solid 2
;
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222
; 22222222

.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111

#if $1000-* < 0
#echo *** Error: VRAM bank1 data occupies too much space 
#else
.dsb $1000-*, 0
#endif

; TILE $00 - Full backdrop color
;
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
; 00000000
.byt $00, $00, $00, $00, $00, $00, $00, $00
.byt $00, $00, $00, $00, $00, $00, $00, $00

; TILE $01 - Solid 1
;
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
.byt $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
.byt $00, $00, $00, $00, $00, $00, $00, $00

; TILE $02 - Stage top
;
; 22222222
; 12121212
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
; 11111111
.byt $00, $aa, $ff, $ff, $ff, $ff, $ff, $ff
.byt $ff, $55, $00, $00, $00, $00, $00, $00

; TILE $03 to $12 - Tree from http://opengameart.org/content/bomb-party
; Author - Matt Hackett of Lost Decade Games
;
; Full picture layout:
; $03 $04 $05 $06
; $07 $08 $09 $0a
; $0b $0c $0d $0e
; $0f $10 $11 $12

.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000001, %00000111, %00001111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000001, %00000110, %00001000 

.byt %00000000, %00000000, %00000000, %00001111, %01111111, %11111111, %11111111, %11111111
.byt %00000000, %00000000, %00000000, %00001111, %01110000, %10001110, %00110001, %11001111

.byt %00000000, %00000000, %00000000, %00011111, %11111111, %11111111, %11111111, %11111111
.byt %00000000, %00000000, %00000000, %00011111, %11100000, %10000000, %11111100, %00000011

.byt %00000000, %00000000, %00000000, %10000000, %11000000, %11100000, %11110000, %11111000
.byt %00000000, %00000000, %00000000, %10000000, %01000000, %00100000, %10110000, %01001000


.byt %00011111, %00011111, %00011111, %00011111, %00111111, %01111111, %01111111, %00111111
.byt %00010001, %00010010, %00010010, %00010001, %00110000, %01001111, %01000000, %00100000

.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %00000010, %00000100, %00001101, %01010010, %10100010, %01000010, %10000101, %10000111

.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %00000000, %11111101, %00000010, %11000001, %00110000, %00001000, %00000111, %00000100

.byt %11111000, %11111100, %11111100, %11111110, %11111110, %11111110, %11111100, %11111110
.byt %10101000, %00010100, %00001100, %00001010, %10010010, %10100010, %10100100, %01101010


.byt %00011111, %00011111, %00111111, %00111111, %01111111, %01111111, %01111111, %01111111
.byt %00011111, %00010100, %00101000, %00101000, %01000100, %01000011, %01000000, %01000000

.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11101000, %00010000, %00010001, %01110001, %01010010, %10001100, %00000010, %10000011

.byt %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111, %11111111
.byt %11111000, %10000100, %01000010, %01000100, %00110100, %01001011, %01000000, %10100000

.byt %11111100, %11111110, %11111110, %11111110, %11111100, %11111100, %11111100, %11111100
.byt %00010100, %00001010, %00001010, %00001010, %00110100, %01010100, %10010100, %10100100


.byt %00111111, %00001100, %00000000, %00000000, %00000000, %00000000, %00000001, %00000011
.byt %00110011, %00001100, %00000000, %00000000, %00000000, %00000000, %00000001, %00000011

.byt %11111111, %11111111, %01111011, %00100000, %01000000, %10000000, %00000000, %10000000
.byt %10000010, %10000100, %01111111, %00111111, %01111111, %11111111, %11111111, %11111111

.byt %11011111, %11000011, %10000010, %00000001, %00000001, %00000000, %00000000, %00000011
.byt %01111110, %01111111, %11111110, %11111111, %11111111, %11111111, %11111111, %11111111

.byt %11111000, %10000000, %00000000, %00000000, %00000000, %11000000, %00100000, %11110000
.byt %01111000, %10000000, %00000000, %00000000, %00000000, %11000000, %11100000, %11110000

; TILE $13 to $1d - Outlined font
;
; Available characters, in order:
; "0123456789%"

.byt %11100011, %11011001, %10100100, %10100100, %10100100, %10011001, %11000011, %11100111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11000111, %10110011, %11010011, %11010011, %11010011, %10111001, %10000011, %11000111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11000011, %10111001, %11000100, %11011001, %10100011, %10111100, %10000001, %11000011
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11000011, %10111001, %11000100, %11011001, %11000100, %10111001, %10000011, %11000111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11100111, %11011011, %10101001, %10111100, %10001001, %11011100, %11000001, %11100011
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11000011, %10111001, %10100011, %10111001, %11000100, %10111001, %10000011, %11000111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11100011, %11011001, %10100011, %10111001, %10100100, %10011001, %11000011, %11100111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11000011, %10111001, %11001001, %11010011, %11010011, %10111001, %10000011, %11000111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11100011, %11011001, %10100100, %11011001, %10100100, %11011001, %11000011, %11100111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11100011, %11011001, %10100100, %11011100, %11000100, %11011001, %11000011, %11100111
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

.byt %11001101, %10100010, %10000100, %11001001, %11010011, %10100001, %01000100, %10010001
.byt %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

#if $2000-* < 0
#echo *** Error: VRAM bank2 data occupies too much space 
#else
.dsb $2000-*, 0
#endif
