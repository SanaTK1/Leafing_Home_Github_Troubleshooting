/// @description Insert description here
// You can write your code in this editor

function do_move(){
	move_and_collide(x_speed, 0, terrain_array);
}

function handle_speed(){
	if (place_meeting(x - 4, y - 2, terrain_array)) // Checks for left-side collisions; want to move right now
	{
		x_dir = 1;
	}
	
	if (place_meeting(x + 4, y - 2, terrain_array)) // Checks for right-side collisions; want to move left now
	{
		x_dir = -1;
	}
	
	
	x_speed = x_dir * max_speed; // Simple; might change later
}


handle_speed();
do_move();