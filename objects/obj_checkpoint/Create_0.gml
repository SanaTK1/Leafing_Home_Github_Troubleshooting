/// @description Declare Variables
// You can write your code in this editor

_is_active = false

frame = 0
frame_max = 11
frame_timer = 0; //Frames for next frame to happen
frame_timer_max = 1;

image_index = 0


/* Functions */
function switch_id(_id_num)
{
	internal_checkpoint_id = checkpoint_id
	
	//show_debug_message("ID Number for this FROM PLAYER is {0}", _id_num);
	//show_debug_message("checkpoint_id IN OBJECT is {0}", internal_checkpoint_id);
	if (internal_checkpoint_id == _id_num)
	{
		_is_active = true;
		//show_debug_message("Checkpoint active! ID: {0}", checkpoint_id);
	}
	else
	{
		_is_active = false;
		//show_debug_message("Not checkpoint active! ID: {0}", checkpoint_id);
	}	
	//alarm_set(0, -1);
}
