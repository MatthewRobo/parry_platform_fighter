/// @description Insert description here
// You can write your code in this editor

gamepad = -99;

for (var i = 0; i < global.gpnum; i++;)
{
	if (global.gp[i] == team) gamepad = i;
}

recovery = obj_controller.roundstart;
state = status.recovery;

switch shottype {
	case shot.bullet:
		ammo = 1;
		bulletspeed = 24;
		gunrecovery = 22;
		gunreload = 38;
		break;
	case shot.shotgun:
		ammo = 1;
		ammomax = 1;
		bulletspeed = 28;
		gunrecovery = 28;
		gunreload = 45;
		shotactive = 8;
		recoil = 6;
		break;
	case shot.wallbang:
		ammo = 1;
		bulletspeed = 24;
		bulletmaxspeed = 40;
		gunrecovery = 60;
		gunreload = 80;
		shotactive = 6;
		break;
}
