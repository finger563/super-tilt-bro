#define NB_OPTIONS 3

default_config:
.(
lda #MAX_STOCKS
sta config_initial_stocks
lda #$01
sta config_ai_level
sta config_player_b_character_palette
sta config_player_b_weapon_palette
lda #$00
sta config_selected_stage
sta config_player_a_character_palette
sta config_player_a_weapon_palette
rts
.)

init_config_screen:
.(
.(
; Ensure that the global game state is "config" from now on
lda #GAME_STATE_CONFIG
sta global_game_state

; Point PPU to Background palette 0 (see http://wiki.nesdev.com/w/index.php/PPU_palettes)
lda PPUSTATUS
lda #$3f
sta PPUADDR
lda #$00
sta PPUADDR

; Write palette_data in actual ppu palettes
ldx #$00
copy_palette:
lda palette_config, x
sta PPUDATA
inx
cpx #$20
bne copy_palette

; Copy background from PRG-rom to PPU nametable
lda #<nametable_config
sta tmpfield1
lda #>nametable_config
sta tmpfield2
jsr draw_zipped_nametable

; Place sprites
ldx #0
sprite_loop:
lda sprites, x
sta oam_mirror, x
inx
cpx #24
bne sprite_loop

; Init local options values from global state
lda audio_music_enabled
sta config_music_enabled
lda #0
sta config_selected_option

; Adapt to configuration's state
jsr config_update_screen

; Process the batch of nt buffers immediately (while the PPU is disabled)
jsr process_nt_buffers
jsr reset_nt_buffers

rts

sprites:
.byt $2f, $3f, $00, $a0
.byt $2f, $3f, $40, $d0
.byt $4f, $3f, $00, $a0
.byt $4f, $3f, $40, $d0
.byt $6f, $3f, $00, $a0
.byt $6f, $3f, $40, $d0
.)
.)

config_screen_tick:
.(
.(
; Clear already written buffers
jsr reset_nt_buffers

; Check if a button is released and trigger correct action
ldx #0
check_one_controller:

lda controller_a_btns, x
bne next_controller

ldy #0
btn_search_loop:
lda buttons_numbering, y
cmp controller_a_last_frame_btns, x
beq jump_from_table
iny
cpy #7
bne btn_search_loop

next_controller:
inx
cpx #2
bne check_one_controller
jmp end

jump_from_table:
tya
asl
tay
lda buttons_actions, y
sta tmpfield1
lda buttons_actions+1, y
sta tmpfield2
jmp (tmpfield1)

; Go to the next screen
next_screen:
.(
lda #GAME_STATE_CHARACTER_SELECTION
sta global_game_state
jsr change_global_game_state
; jmp end ; not needed, change_global_game_state does not return
.)

previous_screen:
.(
lda #GAME_STATE_TITLE
sta global_game_state
jsr change_global_game_state
; jmp end ; not needed, change_global_game_state does not return
.)

next_value:
.(
lda config_selected_option
asl
tax
lda next_value_handlers, x
sta tmpfield1
lda next_value_handlers+1, x
sta tmpfield2
jmp (tmpfield1)
jmp end
.)

previous_value:
.(
lda config_selected_option
asl
tax
lda previous_value_handlers, x
sta tmpfield1
lda previous_value_handlers+1, x
sta tmpfield2
jmp (tmpfield1)
jmp end
.)

next_option:
.(
inc config_selected_option
lda config_selected_option
cmp #NB_OPTIONS
bne end
lda #0
sta config_selected_option

jmp end
.)

previous_option:
.(
dec config_selected_option
bpl end
lda #NB_OPTIONS-1
sta config_selected_option
jmp end
.)

music_next_value:
.(
lda config_music_enabled
eor #%00000001
sta config_music_enabled

beq mute
jsr audio_unmute_music
jmp end
mute:
jsr audio_mute_music
jmp end
.)

stocks_next_value:
.(
inc config_initial_stocks
lda config_initial_stocks
cmp #MAX_STOCKS+1
bne end
lda #0
sta config_initial_stocks
jmp end
.)

ai_next_value:
.(
inc config_ai_level
lda config_ai_level
cmp #MAX_AI_LEVEL+1
bne end
lda #0
sta config_ai_level
jmp end
.)

music_previous_value:
.(
jmp music_next_value
;jmp end ; Not needed, handled by music_next_value
.)

stocks_previous_value:
.(
dec config_initial_stocks
bpl end
lda #MAX_STOCKS
sta config_initial_stocks
jmp end
.)

ai_previous_value:
.(
dec config_ai_level
bpl end
lda #MAX_AI_LEVEL
sta config_ai_level
jmp end
.)

end:
jsr config_update_screen
rts

buttons_numbering:
.byt CONTROLLER_BTN_RIGHT, CONTROLLER_BTN_LEFT, CONTROLLER_BTN_DOWN, CONTROLLER_BTN_UP, CONTROLLER_BTN_START, CONTROLLER_BTN_B, CONTROLLER_BTN_A
buttons_actions:
.word next_value,          previous_value,      next_option,         previous_option,   next_screen,          previous_screen,  next_value

next_value_handlers:
.word music_next_value, stocks_next_value, ai_next_value

previous_value_handlers:
.word music_previous_value, stocks_previous_value, ai_previous_value
.)
.)

config_update_screen:
.(
option_num = tmpfield15

.(
lda #0
sta option_num
values:
jsr config_highligh_option
jsr config_draw_value
inc option_num
lda option_num
cmp #NB_OPTIONS
bne values

rts
.)

config_highligh_option:
.(
;
; Modify nametable attributes to color selected field
;

jsr last_nt_buffer
lda option_num
asl
asl
tay

; Nametable buffer header
loop_header:
lda options_buffer_headers, y
sta nametable_buffers, x
inx
lda options_buffer_headers+1, y
sta nametable_buffers, x
inx
lda options_buffer_headers+2, y
sta nametable_buffers, x
inx
lda options_buffer_headers+3, y
sta nametable_buffers, x
inx

; Determine attribute
lda config_selected_option
cmp option_num
beq enabled
lda #%00000000
jmp got_attribute
enabled:
lda #%10100000
got_attribute:

; Nametable buffer payload
sta nametable_buffers, x
inx
sta nametable_buffers, x
inx
sta nametable_buffers, x
inx
sta nametable_buffers, x
inx

; Close nametable buffer
lda #$00
sta nametable_buffers, x

;
; Modify sprites attributes to color arrows of selected attribute
;

; Set X to point on attribute byte of the first sprite related to this option
lda option_num
asl
asl
asl
adc #2
tax

ldy #0

; Change palette number of option's sprites according to its selected state
set_option_sprites_attributes:
lda option_num
cmp config_selected_option
beq selected

lda oam_mirror, x
and #%11111110
sta oam_mirror, x
jmp next_sprite

selected:
lda oam_mirror, x
ora #%00000001
sta oam_mirror, x

next_sprite:
inx
inx
inx
inx
iny
cpy #2
bne set_option_sprites_attributes

rts

options_buffer_headers:
.byt $01, $23, $c9, $04
.byt $01, $23, $d1, $04
.byt $01, $23, $d9, $04
.)

config_draw_value:
.(
; Jump to the good label regarding option_num
lda option_num
asl
tax
lda values_handlers, x
sta tmpfield2
lda values_handlers+1, x
sta tmpfield3
jmp (tmpfield2)

draw_music:
.(
; Store good buffer's address int tmpfield1
lda config_music_enabled
beq music_disabled

lda #<buffer_on
sta tmpfield1
lda #>buffer_on
sta tmpfield2
jmp send_buffer

music_disabled:
lda #<buffer_off
sta tmpfield1
lda #>buffer_off
sta tmpfield2

; Copy stored buffer
send_buffer:
jsr last_nt_buffer
ldy #0
loop_value:
lda (tmpfield1), y
sta nametable_buffers, x
iny
inx
cpy #8
bne loop_value

jmp end
.)

draw_stocks:
.(
; Set Y to the begining of the good buffer from buffer_one
lda config_initial_stocks
asl
asl
asl
adc config_initial_stocks
adc config_initial_stocks
tay

; Store "buffer end" Y value in tmpfield1
tya
clc
adc #10
sta tmpfield1

; Send buffer
jsr last_nt_buffer
loop_value:
lda buffer_one, y
sta nametable_buffers, x
iny
inx
cpy tmpfield1
bne loop_value

jmp end
.)

draw_ai:
.(
; Set Y to the begining of the good buffer from buffer_human
lda config_ai_level
asl
asl
asl
adc config_ai_level
adc config_ai_level
tay

; Store "buffer end" Y value in tmpfield1
tya
clc
adc #10
sta tmpfield1

; Send buffer
jsr last_nt_buffer
loop_value:
lda buffer_human, y
sta nametable_buffers, x
iny
inx
cpy tmpfield1
bne loop_value

jmp end
.)

end:
rts

values_handlers:
.word draw_music, draw_stocks, draw_ai

buffer_on:
.byt $01, $20, $d5, $03, $45, $44, $02, $00
buffer_off:
.byt $01, $20, $d5, $03, $45, $3c, $3c, $00

buffer_one:
.byt $01, $21, $55, $05, $45, $44, $3b, $02, $02, $00
buffer_two:
.byt $01, $21, $55, $05, $4a, $4d, $45, $02, $02, $00
buffer_three:
.byt $01, $21, $55, $05, $4a, $3e, $48, $3b, $3b, $00
buffer_four:
.byt $01, $21, $55, $05, $3c, $45, $4b, $48, $02, $00
buffer_five:
.byt $01, $21, $55, $05, $3c, $3f, $4c, $3b, $02, $00

buffer_human:
.byt $01, $21, $d5, $05, $3e, $4b, $43, $37, $44, $00
buffer_easy:
.byt $01, $21, $d5, $05, $3b, $37, $49, $4f, $02, $00
buffer_fair:
.byt $01, $21, $d5, $05, $3c, $37, $3f, $48, $02, $00
buffer_hard:
.byt $01, $21, $d5, $05, $3e, $37, $48, $3a, $02, $00
.)
.)
