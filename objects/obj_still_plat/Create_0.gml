/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
cur_percent = 0
//percent_speed = 0.01
cur_dir = 1 // either 1  or -1
dir_multi = 1

platform_touched = false;
platform_returning = false;
platform_staying = false;
has_been_used = false;

start_x = x
start_y = y
end_x = (travel_width * 32) + start_x
end_y = (travel_height * 32) + start_y


end_move_timer = 60;
move_timer = 0;

end_stay_timer = 30;
stay_timer = 0;



if (travel_height < 0){
//start_y = (travel_height * 32) + start_y
//end_y = y
//y = start_y
//cur_percent = 1
//cur_dir = -1
//dir_multi = -1
}


if (travel_width < 0){
start_x = (travel_width * 32) + start_x
end_x = x
x = start_x
}