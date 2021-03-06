#define STATE_ROUTINE(x) .byt >(x-1), <(x-1)
sinbad_state_update_routines:
STATE_ROUTINE(standing_player)
STATE_ROUTINE(running_player)
STATE_ROUTINE(falling_player)
STATE_ROUTINE(jumping_player)
STATE_ROUTINE(jabbing_player)
STATE_ROUTINE(thrown_player)
STATE_ROUTINE(respawn_player)
STATE_ROUTINE(side_tilt_player)
STATE_ROUTINE(special_player)
STATE_ROUTINE(side_special_player)
STATE_ROUTINE(helpless_player)
STATE_ROUTINE(landing_player)
STATE_ROUTINE(crashing_player)
STATE_ROUTINE(down_tilt_player)
STATE_ROUTINE(aerial_side_player)
STATE_ROUTINE(aerial_down_player)
STATE_ROUTINE(aerial_up_player)
STATE_ROUTINE(aerial_neutral_player)
STATE_ROUTINE(aerial_spe_player)
STATE_ROUTINE(spe_up_player)
STATE_ROUTINE(spe_down_player)
STATE_ROUTINE(up_tilt_player)
STATE_ROUTINE(shielding_player)
STATE_ROUTINE(innexistant_player)
STATE_ROUTINE(spawn_player)

sinbad_state_offground_routines:
STATE_ROUTINE(start_falling_player) ; Standing
STATE_ROUTINE(start_falling_player) ; Running
STATE_ROUTINE(dummy_routine) ; Falling
STATE_ROUTINE(dummy_routine) ; Jumping
STATE_ROUTINE(start_falling_player) ; Jabbing
STATE_ROUTINE(dummy_routine) ; Thrown
STATE_ROUTINE(dummy_routine) ; Respawn
STATE_ROUTINE(dummy_routine) ; Side tilt
STATE_ROUTINE(dummy_routine) ; Special
STATE_ROUTINE(dummy_routine) ; Side special
STATE_ROUTINE(dummy_routine) ; Helpless
STATE_ROUTINE(start_helpless_player) ; Landing
STATE_ROUTINE(start_helpless_player) ; Crashing
STATE_ROUTINE(dummy_routine) ; Down tilt
STATE_ROUTINE(dummy_routine) ; Aerial side
STATE_ROUTINE(dummy_routine) ; Aerial down
STATE_ROUTINE(dummy_routine) ; Aerial up
STATE_ROUTINE(dummy_routine) ; Aerial neutral
STATE_ROUTINE(dummy_routine) ; Aerial special neutral
STATE_ROUTINE(dummy_routine) ; Special up
STATE_ROUTINE(dummy_routine) ; Special down
STATE_ROUTINE(dummy_routine) ; Up tilt
STATE_ROUTINE(start_helpless_player) ; Shielding
STATE_ROUTINE(dummy_routine) ; Innexistant
STATE_ROUTINE(dummy_routine) ; Spawn

sinbad_state_onground_routines:
STATE_ROUTINE(dummy_routine) ; Standing
STATE_ROUTINE(dummy_routine) ; Running
STATE_ROUTINE(start_landing_player) ; Falling
STATE_ROUTINE(dummy_routine) ; Jumping
STATE_ROUTINE(dummy_routine) ; Jabbing
STATE_ROUTINE(thrown_player_on_ground) ; Thrown
STATE_ROUTINE(dummy_routine) ; Respawn
STATE_ROUTINE(dummy_routine) ; Side tilt
STATE_ROUTINE(dummy_routine) ; Special
STATE_ROUTINE(dummy_routine) ; Side special
STATE_ROUTINE(start_landing_player) ; Helpless
STATE_ROUTINE(dummy_routine) ; Landing
STATE_ROUTINE(dummy_routine) ; Crashing
STATE_ROUTINE(dummy_routine) ; Down tilt
STATE_ROUTINE(start_landing_player) ; Aerial side
STATE_ROUTINE(start_landing_player) ; Aerial down
STATE_ROUTINE(start_landing_player) ; Aerial up
STATE_ROUTINE(start_landing_player) ; Aerial neutral
STATE_ROUTINE(start_landing_player) ; Aerial special neutral
STATE_ROUTINE(dummy_routine) ; Special up
STATE_ROUTINE(dummy_routine) ; Special down
STATE_ROUTINE(dummy_routine) ; Up tilt
STATE_ROUTINE(dummy_routine) ; Shielding
STATE_ROUTINE(dummy_routine) ; Innexistant
STATE_ROUTINE(dummy_routine) ; Spawn

sinbad_state_input_routines:
STATE_ROUTINE(standing_player_input) ; Standing
STATE_ROUTINE(running_player_input) ; Running
STATE_ROUTINE(check_aerial_inputs) ; Falling
STATE_ROUTINE(jumping_player_input) ; Jumping
STATE_ROUTINE(keep_input_dirty) ; Jabbing
STATE_ROUTINE(thrown_player_input) ; Thrown
STATE_ROUTINE(respawn_player_input) ; Respawn
STATE_ROUTINE(keep_input_dirty) ; Side tilt
STATE_ROUTINE(special_player_input) ; Special
STATE_ROUTINE(dummy_routine) ; Side special
STATE_ROUTINE(keep_input_dirty) ; Helpless
STATE_ROUTINE(keep_input_dirty) ; Landing
STATE_ROUTINE(keep_input_dirty) ; Crashing
STATE_ROUTINE(keep_input_dirty) ; Down tilt
STATE_ROUTINE(keep_input_dirty) ; Aerial side
STATE_ROUTINE(keep_input_dirty) ; Aerial down
STATE_ROUTINE(keep_input_dirty) ; Aerial up
STATE_ROUTINE(keep_input_dirty) ; Aerial neutral
STATE_ROUTINE(dummy_routine) ; Aerial special neutral
STATE_ROUTINE(dummy_routine) ; Special up
STATE_ROUTINE(keep_input_dirty) ; Special down
STATE_ROUTINE(keep_input_dirty) ; Up tilt
STATE_ROUTINE(shielding_player_input) ; Shielding
STATE_ROUTINE(dummy_routine) ; Innexistant
STATE_ROUTINE(keep_input_dirty) ; Spawn

sinbad_state_onhurt_routines:
STATE_ROUTINE(hurt_player) ; Standing
STATE_ROUTINE(hurt_player) ; Running
STATE_ROUTINE(hurt_player) ; Falling
STATE_ROUTINE(hurt_player) ; Jumping
STATE_ROUTINE(hurt_player) ; Jabbing
STATE_ROUTINE(hurt_player) ; Thrown
STATE_ROUTINE(dummy_routine) ; Respawn
STATE_ROUTINE(hurt_player) ; Side tilt
STATE_ROUTINE(hurt_player) ; Special
STATE_ROUTINE(hurt_player) ; Side special
STATE_ROUTINE(hurt_player) ; Helpless
STATE_ROUTINE(hurt_player) ; Landing
STATE_ROUTINE(hurt_player) ; Crashing
STATE_ROUTINE(hurt_player) ; Down tilt
STATE_ROUTINE(hurt_player) ; Aerial side
STATE_ROUTINE(hurt_player) ; Aerial down
STATE_ROUTINE(hurt_player) ; Aerial up
STATE_ROUTINE(hurt_player) ; Aerial neutral
STATE_ROUTINE(hurt_player) ; Aerial special neutral
STATE_ROUTINE(hurt_player) ; Special up
STATE_ROUTINE(hurt_player) ; Special down
STATE_ROUTINE(hurt_player) ; Up tilt
STATE_ROUTINE(shielding_player_hurt) ; Shielding
STATE_ROUTINE(dummy_routine) ; Innexistant
STATE_ROUTINE(dummy_routine) ; Spawn
