/// @description Insert description here
// You can write your code in this editor


function animation_advance()
{
	if _is_active
	{
		//Frame advance
		if(frame >= frame_max)
		{
			frame = frame_max
		}
		else
		{
			if(frame_timer < 0)
			{
				frame++;
				frame_timer = frame_timer_max;
			}
			else
			{
				frame_timer--;
			}
			
		}
	}
	else
	{
		if (frame <= 0)
		{
			frame = 0	
		}
		else
		{
			if(frame_timer < 0)
			{
				frame--;
				frame_timer = frame_timer_max;
			}
			else
			{
				frame_timer--;
			}
		}
	}
	
	image_index = frame;
}



animation_advance();

