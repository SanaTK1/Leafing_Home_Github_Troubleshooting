/// @description Instantiate player variables
// You can write your code in this editor

/* Functions */
function find_all_of_object(_obj_type){
	var _array = []
	for (var _i = 0; _i < instance_number(_obj_type); _i++;)
	{
	    _array[_i] = instance_find(_obj_type, _i);
	} 
	
	return _array
}


/* DON'T CHANGE THESE VARIABLES */
/* -------------------------------------- */

/* SPRITE */
max_index = 2
cur_index = 0

secondary_timer = 0
secondary_timer_max = 9;


move_camera = true

/* States */
current_state = 0
grounded_state = 0
airborne_state = 1
walljump_state = 2
climbing_state = 3

/* Movement directions */
x_dir = 0
y_dir = 0

gravity_strength = 1;

/* Flags */
_want_to_jump = false
_want_to_walljump = false
_walljump_dir = 1
_hold_jump_flag = false

/* Timers */
coyote_timer = 0
walljump_control_timer = 0


/* Acorns */
food_amount = 0
//max_food_amount = 2 // Changes per level (should be the number of food items in the level)
/* food_icon_filepath = spr_food_meter_1
food_x_offset = 72
food_y_offset = 0

food_starting_x = 8
food_starting_y = 720 - 64 - 8 */

/* Reset Vars */
checkpoint_num = 1
reset_pos = find_all_of_object(obj_checkpoint)

/* Sounds */
walking_sounds = [snd_walking_1, snd_walking_2, snd_walking_3, snd_walking_4, 
					snd_walking_5, snd_walking_6, snd_walking_7, snd_walking_8, 
					snd_walking_9, snd_walking_10, snd_walking_11, snd_walking_12, 
					snd_walking_13, snd_walking_14, snd_walking_15, snd_walking_16, 
					snd_walking_17, snd_walking_18, snd_walking_19] // 19 Walking sounds
walking_timer = 0
walking_timer_max = 30 // How long it takes the walking sounds to play

ambiance_sounds = snd_rain_ambiance
tut_music = snd_tutmusic

//audio_play_sound(ambiance_sounds, 10, true, 3.5) // Playing the ambiance

/* Tiles */
var _dirt_tilemap = layer_tilemap_get_id("fg_tiles_dirt");
var _wood_tilemap = layer_tilemap_get_id("fg_tiles_wood");
var _stone_tilemap = layer_tilemap_get_id("fg_tiles_stone");
var _fg_tilemap = layer_tilemap_get_id("fg_tiles")

terrain_array = [obj_ground, _fg_tilemap, obj_mov_plat_constant, _wood_tilemap, _stone_tilemap,_dirt_tilemap]
//Double check if this needs to contain both the moving platform / not?


climbable_array = [obj_climbable_vine]

/* Keys */
/* left_key = [vk_left, ord("A")]
right_key = [vk_right, ord("D")]
up_key = [vk_up, ord("W")]
down_key = [vk_down, ord("S")]*/

/* Checkpoints! */
checkpoint_id = 1;

/* -------------------------------------- */

// The distance to the wall checked when doing walljumps.
walljump_check_dist = 2;


// Speeds applied when jumping / walljumping
y_jump_speed = -9
y_walljump_speed = -7.5
x_walljump_speed = 11


// The strength of gravity when pressing jump vs not
gravity_strength_up = .33;
gravity_strength_down = 1;
gravity_lerp_amount = 0.25;


/* How fast you move back to max speed 
if you're over max speed on ground / in air */
ground_lerp_amount = 0.01
air_lerp_amount = 0.05

/* Movement variables */
x_speed = 0
x_ground_accel = 1
x_ground_decel = 1
x_air_accel = 1
x_air_decel = 0.5
x_max_speed = 4

y_speed = 0
y_max_speed = 20

coyote_max = 5
walljump_control_max = 20; // Third of a sec? 60fps.

/* Camera Controls! */
camera_lerp_amount = 0.04