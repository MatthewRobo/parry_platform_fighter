var volstring = global.musicgain > 0 ? string(global.musicgain*10) + "%" : "OFF";
modestr[3] = "Music: " + volstring;
if (!global.inassign) {
	for (var device = 0; device < GP+KB; device++) {
		if (global.mode != -2 || !expanded) {
			if global.pressed[device][input.L] {
				palette--;
				audio_play_sound(snd_shield,0,0);
			}
			if global.pressed[device][input.R] {
				palette++;
				audio_play_sound(snd_shield,0,0);
			}
		}
		if (expanded) {
			if (global.pressed[device][input.ST]) {
				switch global.mode {
					case gamemode.training:
						global.lookup[0] = device;
						for (var i = 1; i < PLAYERS; i++) {
							global.lookup[i] = GP+KB;
						}
						room_goto(Room_Select);
						break;
					case -1: game_end(); audio_play_sound(snd_parry,0,0); break;
					case -2: audio_stop_sound(obj_playlist.nowplaying); audio_play_sound(snd_parry,0,0); palette = irandom(11); break;
					default: room_goto_next(); break;
					
				}
			} else {
				if (global.pressed[device][input.U]) {
					selected--;
					audio_play_sound(snd_shield,0,0);
				}
				if (global.pressed[device][input.D]) {
					selected++;
					audio_play_sound(snd_shield,0,0);
				}
				if global.pressed[device][input.SE] {
					expanded = 0;
					audio_play_sound(snd_shield,0,0);
				}
				if (global.mode == -2) {
					if global.pressed[device][input.L] {
						global.musicgain--;
						audio_play_sound(snd_shield,0,0);
					}
					if global.pressed[device][input.R] {
						global.musicgain++;
						audio_play_sound(snd_shield,0,0);
					}
				}
			}
		} else {
			if (global.pressed[device][input.ST]) {
				expanded = 1;
				audio_play_sound(snd_parry,0,0);
			}
		}
	}
}

selected = (selected + modelen) mod modelen;
selectedlerp = lerp(selectedlerp,selected,lerpfactor);
global.mode = modes[selected];

palette = (palette + 12) mod 12;

switch palette {
	case 0:
		global.color[0] = $5100ff;
		global.color[1] = $ff8000;
		global.color[2] = $0051ff;
		//global.color[3] = $cccc00;
		global.color[3] = $ffcc00;
		//global.bgcolor = $09121f;
		//global.fgcolor = $445566;
		//global.bgcolor = $222222;
		global.bgcolor = $1d1616;
		//global.fgcolor = $3f3f3f;
		global.fgcolor = $694f4f;
		global.fgcolor2 = $99ccff;
		break;
	case 1:
		global.color[0] = $ff0099;
		global.color[1] = $0dff00;
		global.color[2] = $ff66aa;
		global.color[3] = $90ff90;
		global.bgcolor = $05080f;
		global.fgcolor = $332244;
		global.fgcolor2 = $ffaaff;
		break;
	case 2:
		global.color[0] = $6ecdff;
		global.color[1] = $b5599b;
		global.color[2] = $8eabff;
		global.color[3] = $9b59b5;
		global.bgcolor = $1d1616;
		global.fgcolor = $332727;
		global.fgcolor2 = $f8f8f8;
		break;
	case 3: // GREEN ORANGE
		global.color[0] = $0080ff;
		global.color[1] = $799400;
		global.color[2] = $00ccff;
		global.color[3] = $cd9300;
		global.bgcolor = $231d00;
		global.fgcolor = $071f33;
		global.fgcolor2 = $73c0ff;
		break;
	case 4: // BLUE ORANGE
		global.color[0] = $0080ff;
		global.color[1] = $cd9300;
		global.color[2] = $00ccff;
		global.color[3] = $799400;
		global.bgcolor = $461d00;
		global.fgcolor = $023455;
		global.fgcolor2 = $3eb6ff;
		break;
	case 5: // RED BLUE
		global.color[0] = $3741e6;
		global.color[1] = $ff8c00;
		global.color[2] = $0080ff;
		global.color[3] = $ffcc33;
		global.bgcolor = $2b0a30;
		global.fgcolor = $801e00;
		global.fgcolor2 = $e1ff3f;
		break;
	case 6: // COOL DAY
		global.color[0] = $8000ff;
		global.color[1] = $ffff80;
		global.color[2] = $ff00ff;
		global.color[3] = $ffcc00;
		global.bgcolor = $925502;
		global.fgcolor = $2b0047;
		global.fgcolor2 = $a851ff;
		break;
	case 7: // PAC MAN
		global.color[0] = c_red;
		global.color[1] = c_aqua;
		global.color[2] = c_orange;
		global.color[3] = $ff8000;
		global.bgcolor = $090909;
		global.fgcolor = $aa0000;
		global.fgcolor2 = c_yellow;
		break;
	case 8: // JET GRIND RADIO
		global.color[0] = $42e4e2;
		global.color[1] = $42c183;
		global.color[2] = $39a9ed;
		global.color[3] = $c1c100;
		global.bgcolor  = $82363f;
		global.fgcolor  = $121B80;
		global.fgcolor2 = $504fc4;
		break;
	case 9: // VASQUEZ
		global.color[0] = $04ccfe;
		global.color[1] = $491490;
		global.color[2] = $04fecc;
		global.color[3] = $901449;
		global.bgcolor = $829388;
		global.fgcolor = $4d564f;
		global.fgcolor2 = c_black;
		break;
	case 10: // WORDLE
		global.color[0] = $3b9fb5;
		global.color[1] = $4e8d53;
		global.color[2] = $3a79f5;
		global.color[3] = $f9c085;
		global.bgcolor = $131212;
		global.fgcolor = $3c3a3a;
		global.fgcolor2 = $848381;
		break;
	case 11: // PICO-8
		global.color[0] = $a877ff;
		global.color[1] = $36e400;
		global.color[2] = $00aeff;
		global.color[3] = $ffad29;
		global.bgcolor = $532b1d;
		global.fgcolor = $4f575f;
		global.fgcolor2 = $aaccff;
		break;
	//case 9: // PAPER
	//	global.color[0] = c_green;
	//	global.color[1] = c_blue;
	//	global.bgcolor = c_white;
	//	global.fgcolor = c_grey;
	//	global.fgcolor2 = c_black;
	//	break;
}

show_debug_message(palette);


gbid = layer_background_get_id("background");
layer_background_blend(gbid, global.bgcolor);

if (GREYBOX) {
	global.color[0] = c_yellow;
	global.color[1] = c_aqua;
	global.bgcolor = c_black;
	global.fgcolor = c_white;
	global.fgcolor2 = c_grey;
}

openlerp = lerp(openlerp,expanded ? expanded : dsin(breathing) * 0.03 - 0.03,0.2);
breathing++;
