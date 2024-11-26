/// @description Insert description here
// You can write your code in this editor

function debug_text(){
	/* Debug stuff! */
	draw_text(10, 10, x_speed) // Top-left number
	draw_text(10, 25, y_speed) // Bottom-left number
	draw_text(50, 25, x_dir) // Bottom-right number

	// Issue with moving camera
	/* draw_text(x+25, y-30, current_state) // Follows player
	draw_text(x+25, y+30, coyote_timer) */
	draw_text(90, 10, current_state) // Follows player
	draw_text(90, 25, coyote_timer)

	//draw_text(10, 700, food_amount) // Bottom left corner of screen
}



/*function draw_food_meter()
{
	/* Draws the food meter as it's currently filled. *
	for (var _i = 0; _i < max_food_amount; _i++)
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
} */

//debug_text();
//draw_food_meter();
