/// @description Insert description here
// You can write your code in this editor

roundstart = 80;
global.hitstop = 0;
restart = 0;
quit = 0;
global.firstto = 30;

if (global.mode == gamemode.training) {
	roundstart = 0;
	global.firstto = 999;
}

audio_play_sound(snd_dies,0,0);
