/// @description Player Movement Code

/* 
------------------------------------------------------------------
BUG TRACKER (Add bugs here!): 

	1) If you run into a wall, you raise slightly off the ground
	enough for the game to think that you're in air, even when you
	shouldn't be. 
		- Check grounded check? When it happens the player
		seems to float off of the ground by a pixel or two.
		- Note: state is airborne the entire time
	
	2) If you jump into a low ceiling:
		- you shift slightly to the left (?)
		
	3) Moving platforms aren't the best right now--they don't move
	nicely
	
	OTHER BUGS:
	
		
------------------------------------------------------------------

MECHANIC WISHLIST (TODO):
	1) Wall-sliding(?)
	2) Might need to adjust feel of jump? Further testing required
	3) Maybe need to adjust feel of walljump?
	
------------------------------------------------------------------*/


function play_jump_sound(){
	audio_play_sound(snd_jump, 1, false)
}

function move_all()
{
	/* Movement code that runs in all states. */
	move_and_collide(x_speed, y_speed, terrain_array);
	
	
	/* Post walljump control timer decrement */
	walljump_control_timer--;
}

function check_if_can_climb(){
	/* Check if the player is currently
	touching something which is climbable. */
	
	return place_meeting(x, y, climbable_array);
}

function climbing_movement_step()
{
	y_speed = y_dir * 5;
	x_speed = x_dir * 5;
	
	if(not check_if_can_climb()){
		current_state = airborne_state;
	}
	
	if (_want_to_jump){
		_want_to_jump = false;
		jump_impulse();
		current_state = airborne_state;
	}
}

function check_grounded()
{
	/* Check if the player is currently grounded
	(defined as touching an "obj_ground" below it.
	As we get more objects that could be ground, will
	update with more cases. */
	var check_dist = max(2, y_speed)
	
	
	if(place_meeting(x, y + check_dist, terrain_array))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function walljump_check(_dir)
{
	/* Check if the player is able to walljump in the given
	direction (_dir: 1 = right, -1 = left). 
	_dir should ONLY be -1 or 1. */
	
	if(place_meeting((x + (_dir * walljump_check_dist)), y, terrain_array))
	{
		return true;
	}
}

function walljump_movement_step()
{
	/* Steps to perform if the player's state is 
	walljumping. */
	
	current_state = airborne_state;
	_want_to_walljump = false;
	walljump_control_timer = walljump_control_max;
	
}

function walljump_impulse(_dir)
{
	/* Applies the impulse for when the player begins to 
	walljump. It applies a y impulse upwards of strength
	y_walljump_speed, and an x impulse of strength
	x_walljump_speed in the opposite direction of the wall
	(_dir * -1). */
	
	y_speed = y_walljump_speed;
	x_speed = x_walljump_speed * (_dir * -1); 
	x_dir = _dir * -1
	play_jump_sound()
	
}

function ceiling_check()
{
	/* Check if there is a ceiling above the player. */
	
	if(place_meeting(x, y-2, terrain_array))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function apply_gravity()
{ 
	/* Applies gravity. If y_speed is less than y_max_speed,
	then we increase y_speed by gravity_strength. If not,
	we lerp y_speed to come back to y_max_speed over time. 
	(Replicating terminal velocity) */
	
	if y_speed <= y_max_speed
	{
		y_speed += gravity_strength;
	}
	else
	{
		y_speed = lerp(y_max_speed, y_speed, gravity_lerp_amount);
	}
	
	if _hold_jump_flag and y_speed < 0
	{
		gravity_strength = gravity_strength_up
	}
	else
	{
		gravity_strength = gravity_strength_down
	}
}
function air_x_acceleration()
{
	/* Accelerates the player on the ground according to the
	direction that they're pressing. If their x speed is greater
	than the max speed, then it lerps the x speed back towards the max. */
	
	if (x_speed <= x_max_speed) and (x_speed >= -1 * x_max_speed)
	{
		x_speed += (x_air_accel * x_dir);
	}
	else
	{
		if x_speed > 0
		{
			x_speed = lerp(x_max_speed, x_speed, air_lerp_amount);
		}
		else
		{
			x_speed = lerp(x_speed, x_max_speed, air_lerp_amount);
		}
	}
}
function air_x_deceleration()
{
	/* Deccelerates the player opposite to their current movement. 
	If the player's x speed is within a threshold value, set it to 0
	so they don't get stuck in a loop. */
	
	_threshold = 0.25
	
	if x_speed > _threshold
	{
		x_speed -= x_air_decel;
	}
	else if (x_speed < -1 * _threshold)
	{
		x_speed += x_air_decel;
	}
	else
	{
		x_speed = 0;
	}
}

function air_movement_step()
{
	/* Steps to perform if the player's state is airborne. */
	
	if (x_dir != 0 && walljump_control_timer <= 0)
	{
		air_x_acceleration()
	}
	else
	{
		air_x_deceleration()
	}
	
	if (_want_to_walljump)
	{
		walljump_impulse(_walljump_dir);
		current_state = walljump_state;
	}
	
	apply_gravity();
	
	if check_grounded()
	{
		current_state = grounded_state;
	}
	
	if ceiling_check() and y_speed < 0
	{
		y_speed = 0 // Fix for crashing head into ceilings	
	}
	
	if _want_to_jump and coyote_timer > 0
	{
		jump_impulse();
		// current_state = airborne_state;
		_want_to_jump = false;
	}
	
	coyote_timer -= 1
	walking_timer = 0
}



function jump_impulse()
{
	/* Makes the player's y_speed equal to y_jump_speed when they jump. */
	y_speed = y_jump_speed;
	play_jump_sound()
}

function ground_x_acceleration()
{
	/* Accelerates the player on the ground according to the
	direction that they're pressing. If their x speed is greater
	than the max speed, then it lerps the x speed back towards the max. */
	
	if (x_speed <= x_max_speed) and (x_speed >= -1 * x_max_speed)
	{
		x_speed += (x_ground_accel * x_dir);
	}
	else
	{
		if x_speed > 0
		{
			x_speed = lerp(x_max_speed, x_speed, ground_lerp_amount);
		}
		else
		{
			x_speed = lerp(x_speed, x_max_speed, ground_lerp_amount);
		}
	}
	
}

function ground_x_decceleration()
{
	/* Deccelerates the player opposite to their current movement. 
	If the player's x speed is within a threshold value, set it to 0
	so they don't get stuck in a loop. */
	
	_threshold = 0.5
	
	if x_speed > _threshold
	{
		x_speed -= x_ground_decel;
	}
	else if (x_speed < -1 * _threshold)
	{
		x_speed += x_ground_decel;
	}
	else
	{
		x_speed = 0;
	}
}

function set_reset_position()
{
	/* Sets the player's last safe reset position */
	
	//if(place_meeting(x, y+5, obj_ground)) // Checks if there's ground below you by 5
	//{
		last_safe_x = x;
		last_safe_y = y;
	//}
}

function play_walk_sound()
{
	if(walking_timer < 0)
	{

		random_int = random_range(0,18) div 1
		audio_play_sound(walking_sounds[random_int], 1, false)
		walking_timer = walking_timer_max
	}
}

function ground_movement_step()
{
	/* Steps to perform if the player's state is grounded. */
	
	if (y_speed > 0)
	{
		y_speed = 0; // If we're grounded, y_speed should be 0.
	}
	
	if (x_dir != 0)
	{
		ground_x_acceleration()
		play_walk_sound()
	}
	else
	{
		ground_x_decceleration()
	}
	
	if (_want_to_jump)
	{
		jump_impulse();
		current_state = airborne_state;
		_want_to_jump = false;
	}
	
	if check_grounded()
	{
		current_state = grounded_state;
	}
	else // In case we drop off of a ledge without pressing jump
	{
		current_state = airborne_state;
	}
	
	//Clear Vars
	_want_to_jump = false;
	_want_to_walljump = false;
	coyote_timer = coyote_max
	
	walking_timer--;
}

function check_inputs()
{
	/* Reads inputs from keyboard, and assigns
	them to corresponding variables. */
	
	// Movement checks
	if keyboard_check(vk_right) or keyboard_check(ord("D"))
	{
		x_dir = 1;
	}
	else if keyboard_check(vk_left) or keyboard_check(ord("A"))
	{
		x_dir = -1;
	}
	else
	{
		x_dir = 0;
	}
	
	// Climbing checks
	if (keyboard_check(vk_up) or keyboard_check(ord("W"))) 
	{
		y_dir = -1;
		
		if check_if_can_climb() 
		{
			current_state = climbing_state;
		}
	}
	else if (keyboard_check(vk_down) or keyboard_check(ord("S")))
	{
		y_dir = 1;
	}
	else
	{
		y_dir = 0;	
	}

	
	// Jumping checks
	if keyboard_check_pressed(vk_space)
	{
		if current_state == grounded_state 
		{
			_want_to_jump = true;	
		}
		
		else if current_state == airborne_state
		{
			if walljump_check(1)
			{
				_want_to_walljump = true;
				_walljump_dir = 1;
			}
			else if walljump_check(-1)
			{
				_want_to_walljump = true;
				_walljump_dir = -1;
			} 
			
			else if coyote_timer > 0
			{
				_want_to_jump = true;
			}
		}
		
		else if current_state == climbing_state
		{
			_want_to_jump = true;
		}
	}
	
	// Holding gravity checks
	if(keyboard_check(vk_space)){
		_hold_jump_flag = true
	}
	else
	{
		_hold_jump_flag = false
	}
	
	
	/* DEBUGGGGGGG */
	if(keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_return)){
		room_goto_next();
	}
	
	
}


function state_loops()
{
	/* Loop through the possible states each frame */
	
	check_inputs()
	
	if(current_state == 0) // grounded
	{
		ground_movement_step();
	}
	if(current_state == 1) // airborne
	{
		air_movement_step();
	}
	if(current_state == 2) // walljump
	{
		walljump_movement_step();
	}
	if(current_state == 3) // climbing
	{
		climbing_movement_step();	
	}
	
	move_all()
}

function camera_loop()
{
	/* CAMERA STUFF https://gamemaker.io/en/tutorials/cameras-and-views */
	
	var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
	var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

	var _viewX = camera_get_view_x(view_camera[0]);
	var _viewY = camera_get_view_y(view_camera[0]);
	var _viewW = camera_get_view_width(view_camera[0]);
	var _viewH = camera_get_view_height(view_camera[0]);

	var _gotoX = x  - (_viewW * 0.5) //+ (_hor * 200);
	var _gotoY = y - (_viewH * 0.5) - 100; //+ (_ver * 150) ;

	var _newX = lerp(_viewX, _gotoX, camera_lerp_amount);
	var _newY = lerp(_viewY, _gotoY, camera_lerp_amount);

	if _newY > room_height - _viewH
	{
		_newY = room_height - (_viewH);
	}


	camera_set_view_pos(view_camera[0], _newX, _newY);
}


/* SPRITE STUFF / ANIM STUFF */
function sprite_changes()
{
	/* Updates the squirrel's x direction sprite */
	if (x_dir == 1){
		image_xscale = 1
		if(current_state = grounded_state){
		image_index = cur_index
		}
		else{
			image_index = 1	
		}
		update_image_index();
	}
	
	if (x_dir == -1){
		image_xscale = -1
		if(current_state = grounded_state){
		image_index = cur_index;
		}
		else{
			image_index = 1	;
		}
		update_image_index();
	}
	
	if (x_dir == 0){
		image_index = 0;
		cur_index = 0;
	}
	
}


function update_image_index(){
	
	/* Increments the squirrel's sprite's image number */
	
	secondary_timer++;
	
	if (secondary_timer >= secondary_timer_max){
		cur_index += 1;
		secondary_timer = 0;
	}
	if cur_index > max_index{
		cur_index = 0;	
	}
}

sprite_changes();



// Run the state loops

state_loops();

if (move_camera)
{
	camera_loop();
}




