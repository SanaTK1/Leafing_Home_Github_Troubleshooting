/// @description Insert description here
// You can write your code in this editor

window_set_size(1280, 720);

view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, -1, -1);

if(!audio_is_playing(snd_tutmusic) and room == tutorial_room or room == title_room){
	audio_stop_all();
	audio_play_sound(snd_tutmusic, 10, true, 1) // Playing the ambiance
}
if(!audio_is_playing(snd_level1_music) and room == level_1){
	audio_stop_all();
	audio_play_sound(snd_level1_music, 10, true, 1) // Playing the level 1 music
}
