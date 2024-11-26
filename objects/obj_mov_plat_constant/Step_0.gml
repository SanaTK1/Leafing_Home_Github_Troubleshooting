/// @description Insert description here
// You can write your code in this editor

if (cur_dir == 1){
	cur_percent += percent_speed
}

else{
	cur_percent -= percent_speed
}

if (cur_percent > 1 or cur_percent < 0){
	cur_dir *= -1
	
}

x = lerp(start_x, end_x, cur_percent)
y = lerp(start_y, end_y, cur_percent)