/// @description Insert description here
// You can write your code in this editor
door_open = false

function open_door(){
	door_open = true;
}

function add_acorn(_acorn_amt){
	
	if(_acorn_amt == 6){
		image_index = 7;	
	}
	else
	{
		image_index = _acorn_amt;	
	}
}