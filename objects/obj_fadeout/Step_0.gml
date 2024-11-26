/// @description Insert description here
// You can write your code in this editor



if(!did_first_step){
	
	if(forwards)
	{
		frame = 0
	}
	else
	{
		frame = frame_max
	}
	did_first_step = true;
}

if(forwards)
{
	if(frame >= frame_max){
		if(room == room_last)
		{
			room_goto(0);
			audio_stop_sound(snd_rain_ambiance);
		}
		else
		{
			audio_stop_sound(snd_rain_ambiance);
			room_goto_next();	
		}
	}
	else
	{
	frame++;
	}
	
	//x = camera_get_view_x(view_camera[0]) //- (camera_get_view_width(view_camera[0])) / 2, 
	//y = camera_get_view_y(view_camera[0])
} 

else
{
	if (frame <= 0)
	{
		instance_destroy()
	}
	else
	{
		frame--;
	}
	
	//x = 1280 + camera_get_view_x(view_camera[0]) - (camera_get_view_width(view_camera[0]) / 2)
	//y = 720 + camera_get_view_y(view_camera[0]) - (camera_get_view_height(view_camera[0]) / 2)
}

image_index = frame


