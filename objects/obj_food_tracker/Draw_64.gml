/// @description Insert description here
// You can write your code in this editor

function draw_food_meter()
{
	prev_alpha = draw_get_alpha();
	
	draw_set_alpha(alpha_amount);
	
	/* Draws the food meter as it's currently filled. */
	for (var _i = 0; _i < food_amount_max; _i++)
	{
		var _spr_x = food_starting_x + (food_x_offset * _i);
		var _spr_y = food_starting_y + (food_y_offset * _i);
		if _i <= food_amount - 1
		{
			//Draw filled food meter
			draw_sprite(food_icon_filepath, 1, _spr_x, _spr_y);
		}
		else
		{
			//Draw unfilled food meter	
			draw_sprite(food_icon_filepath, 2, _spr_x, _spr_y);
		}
	}
	
	draw_set_alpha(prev_alpha);
}

draw_food_meter();