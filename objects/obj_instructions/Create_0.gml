/// @description Insert description here
// You can write your code in this editor

timer = 0;

if (global.mode == gamemode.training) {
	room_goto_next()
}


gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);
