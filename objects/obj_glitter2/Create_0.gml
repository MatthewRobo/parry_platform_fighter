/// @description Insert description here
// You can write your code in this editor

timer = 240;
hspeed = irandom_range(1,10);
if (x>room_width/2) hspeed *= -1;
if (irandom(2)) hspeed *= -1;
image_alpha = 0;
alpha = 0;
thickness = irandom_range(2,12);
team = irandom(1);
if (global.mode == gamemode.teamvs) team = irandom(3);
alpha2 = 1;
alphamax = random_range(0.3,0.9);
