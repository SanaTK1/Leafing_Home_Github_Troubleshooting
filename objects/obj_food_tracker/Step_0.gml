/// @description Insert description here
// You can write your code in this editor

function fade()
{
	switch fade_status
	{
		case 1: // fade-in
		grab_timer = clamp(grab_timer, 0, grab_timer_max)
		grab_timer++;
		alpha_amount = (1.0 / 60.0) * grab_timer
		
		if(grab_timer >= grab_timer_max)
		{
			stay_timer = stay_timer_max;
			fade_status = 2;
		}
		break;
		
		case -1: //fade-out
		grab_timer = clamp(grab_timer, 0, grab_timer_max)
		grab_timer--;
		alpha_amount = (1.0 / 60.0) * grab_timer
		
		if(grab_timer <= 0)
		{
			fade_status = 0;
			grab_timer = 0;
		}
		break;
		
		case 2: //holding state
		stay_timer--;
		if(stay_timer <= 0)
		{
			grab_timer = grab_timer_max;
			fade_status = -1;
		}
		break;
		
		default:
		break;
		
		case 0: //nothing
		break;
	}
		
}

function endDoorCheck(){
	if food_amount >= food_amount_max {
		with(obj_enddoor){
			open_door();
		}
	}

	with(obj_enddoor){
		add_acorn(other.food_amount);
	}
}

fade();
endDoorCheck();