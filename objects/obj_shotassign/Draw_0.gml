/// @description Insert description here
// You can write your code in this editor


draw_set_colour(global.fgcolor2);
draw_set_alpha(1);
xdraw = room_width / 2;


draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

ydraw = 24;
mode = "";

switch global.mode {
	case gamemode.versus:
		mode = "Local VS";
		break;
	case gamemode.training:
		mode = "Training Mode";
		break;
}
draw_set_color(global.fgcolor2);
draw_set_valign(fa_top);
ydraw = 20;
draw_text(xdraw,ydraw,mode);

draw_set_valign(fa_middle);
xdraw = room_width / 2;
ydraw = room_height / 8;

shottext = array_create(cols,"");
playertext = array_create(PLAYERS,array_create(cols,""));

for (p = -1; p < global.pmax; p++) {

	if (p < 0) {
		for (i = 0; i < shot.length; i++) {
			xpos = i mod cols;
			text = "";
			switch i {
				case shot.bullet: text += "Marksman"; 
				break;
				case shot.shotgun: text += "Shotgun"; 
				break;
				case shot.wallbang: text += "Wallbanger"; 
				break;
				case shot.whiffpunisher: text += "Flicker"; 
				break;
				case shot.booster: text += "Booster"; 
				break;
				case shot.trailer: text += "Wall"; 
				break;
				case shot.grenade: text += "Grenade"; 
				break;
				case shot.geyser: text += "Geyser"; 
				break;
				case shot.sin: text += "Trig";
				break;
				case shot.whip: text += "Whip";
				break;
				case shot.wall2: text += "Beam";
				break;
				case shot.random: text += "Anarchy";
				break;
				default: text += "UNNAMED";
				break;
			}
			text += "\n\n";
			shottext[xpos] += text;
		}
	} else if (p < PLAYERS) {
		draw_set_color(global.fgcolor2);
		for (i = 0; i < shot.length; i++) {
			xpos = i mod cols;
			text = "\n";
			//if (p == 1) text += "]";

			if (i == global.shots[p]) {
							text += "[";
				if (p == 1) text += "";
				text += "P" + string(p+1);
				if (p == 0) text += "";
							text += "]";
			}
			//if (p == 0) text += "[";

			text += "\n";
			playertext[p][xpos] += text;
		}
	}
}

ydraw = room_height/9;
gap = string_width("WALLBANGER");
gap *= clamp(global.pmax / 2,1,1.5);
//pgap = 150;
pgap = string_width("[P2]") / 2;
draw_set_valign(fa_top);


vgap = 0;
for (i = 0; i < cols; i++) {
	j = i - (cols - 1) / 2;
	draw_set_colour(c_white);
	draw_text(xdraw + gap * j, ydraw, shottext[i]);
	for (p = 0; p < global.pmax; p++) {
		//k = p == 0 ? -pgap : pgap;
		switch p {
			case 0: k = -pgap; break;
			case 1: k = pgap; break;
			case 2: k = -3 * pgap; break;
			case 3: k = 3 * pgap; break;
		}

		l = p == 0 ? -vgap/3 : vgap/3;
		l -= 8;
		draw_set_colour(global.fgcolor2);
		if (ready[p]) draw_set_colour(global.color[p]);
		draw_text(xdraw + gap * j + k, ydraw + l, playertext[p][i]);
	}
	ydraw += vgap;
}


for (p = 0; p < global.pmax; p++) {
	ydraw = room_height * 0.75;
	if (p < global.pmax) {
		desc = "";
		switch global.shots[p] {
			case shot.bullet: desc += "Basic shot.\nFast recovery/reload.";
			break;
			case shot.shotgun: desc += "Spread shot.\nShort range.";
			break;
			case shot.wallbang: desc += "Big and slow.\nGoes through walls.";
			break;
			case shot.whiffpunisher: desc += "Midrange shots.\nSix ammo.";
			break;
			case shot.booster: desc += "Burst of speed.\nFive ammo.";
			break;
			case shot.trailer: desc += "Deadly wall.\nVery slow.";
			break;
			case shot.grenade: desc += "Has gravity.\nExplodes.";
			break;
			case shot.geyser: desc += "Hits far, then near.\nTwo ammo.";
			break;
			case shot.sin: desc += "Sine, cosine, tangent.\nThree ammo.";
			break;
			case shot.whip: desc += "Some spread.\nTwo ammo.";
			break;
			case shot.wall2: desc += "Lethal beam.\nRather sluggish.";
			break;
			case shot.random: desc += "Get lucky?";
			break;
			default: desc += "NO DESCRIPTION EXISTS";
			break;
		}

		k = p == 0 ? room_width * 0.25 : room_width * 0.75;
		draw_set_font(Font1);
		if (global.pmax == 4) {
			switch p {
				case 0: k = room_width * 3 / 8; break;
				case 1: k = room_width * 5 / 8; break;
				case 2: k = room_width * 1 / 8; break;
				case 3: k = room_width * 7 / 8; break;
			}
			draw_set_font(fnt_smalldesc);
			
		}
		
		draw_set_colour(global.fgcolor2);
		if (ready[p]) draw_set_colour(global.color[p]);
		//draw_set_colour(global.color[p]);
		draw_text(k,ydraw,desc);
		draw_set_font(Font1);
	}
}


