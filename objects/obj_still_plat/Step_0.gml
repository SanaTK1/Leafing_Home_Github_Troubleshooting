/// @description Insert description here
// You can write your code in this editor

function move_plat(){
	cur_percent += percent_speed



	if (cur_percent > 1){
		cur_dir *= -1 
		platform_touched = false
		
		cur_percent = 1
		
		if(!one_time_use){	
			platform_staying = true
			stay_timer = end_stay_timer
		}
	}
	
}

function return_plat()
{
	cur_percent -= percent_speed * 2
	
	if (cur_percent < 0){
		cur_dir *= -1	
		platform_returning = false
		cur_percent = 0
		move_timer = end_move_timer;
	}
}

function stay_plat(){
	stay_timer--;
	
	if stay_timer < 0
	{
		platform_staying = false
		platform_returning = true
	}
}

function is_player_touching(){
	
	if(place_meeting(x, y - 4, obj_player) ){
		//show_debug_message("Trying to touch!");
		if( !platform_touched and !platform_returning and move_timer < 0)
		{
			if(one_time_use and has_been_used){
				return
			}
		
			has_been_used = true
			platform_touched = true;
			//show_debug_message("Touched!");
		}
	}
}


x = lerp(start_x, end_x, cur_percent)
y = lerp(start_y, end_y, cur_percent)
is_player_touching();

move_timer--;



if(platform_touched){
	move_plat();
}
if(platform_returning){
	return_plat();
}
if(platform_staying){
	stay_plat();
}

