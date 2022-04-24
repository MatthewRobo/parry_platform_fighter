/// @description Insert description here
// You can write your code in this editor

for (var p = 0; p < PLAYERS; p++;)
{
	var device = global.lookup[p]; // d for DEVICE
	if (!ready[p]) {
		if global.pressed[device][input.U] {
			pos[p]--;
		}
		if global.pressed[device][input.D] {
			pos[p]++;
		}
		pos[p] = (pos[p] + total_options) mod total_options;
		if (device < GP) {
			if (pos[p] == 3) pos[p] = total_options-1;
			pos[p] = clamp(pos[p],4,total_options);
		}
		
		for (var button = gp_face1; button < gp_axisrv; button++) {
			if (gamepad_button_check_pressed(device, button)) 
			&& (button != gp_padu) && (button != gp_padd)
			&& (button != gp_padl) && (button != gp_padr) {
				if (pos[p] > 3 && pos[p] < input.length) {
					global.mainbind[device][pos[p]] = button;
					global.subbind[device][pos[p]] = -1;
					pos[p]++;
					exit;
				}
				if (pos[p] == input.length) {
					ready[p] = true;
				}
				if (pos[p] = input.length + 1) {
					show_debug_message("reset to default");
					var d = device;
					for (var e = 0; e < 2; e++) {
						for (var i = 0; i < input.length; i++) {
							var k = e == 0 ? "main" : "alt";
							var v = -1;
							switch i {
								case input.L: k += "Left"; break;
								case input.D: k += "Down"; break;
								case input.U: k += "Up"; break;
								case input.R: k += "Right"; break;
								case input.ST: k += "Start"; break;
								case input.SE: k += "Select"; break;
								case input.JU: k += "J"; break;
								case input.SL: k += "A"; break;
								case input.SH: k += "B"; break;
								case input.PA: k += "C"; break;
							}
							if (d < GP) {
								switch i {
									case input.L: v = gp_padl; break;
									case input.D: v = gp_padd; break;
									case input.U: v = gp_padu; break;
									case input.R: v = gp_padr; break;
									case input.ST: v = gp_start; break;
									case input.SE: v = e == 0 ? gp_select : gp_stickr; break;
									case input.JU: v = e == 0 ? gp_face1 : gp_shoulderl; break;
									case input.SL: v = e == 0 ? gp_face3 : gp_shoulderlb; break;
									case input.SH: v = e == 0 ? gp_face4 : gp_shoulderrb; break;
									case input.PA: v = e == 0 ? gp_face2 : gp_shoulderr; break;
								}
							} else if (!global.browser) {
								if (d == GP) {
									switch i {
										case input.L: v = ord("S"); break;
										case input.D: v = ord("D"); break;
										case input.U: v = ord("E"); break;
										case input.R: v = ord("F"); break;
										case input.ST: v = ord("Q"); break;
										case input.SE: v = ord("W"); break;
										case input.JU: v = ord("K"); break;
										case input.SL: v = ord("J"); break;
										case input.SH: v = ord("L"); break;
										case input.PA: v = vk_space; break;
									}
								} else if (d == GP+1) {
									switch i {
										case input.L: v = vk_left; break;
										case input.D: v = vk_down; break;
										case input.U: v = vk_up; break;
										case input.R: v = vk_right; break;
										case input.ST: v = vk_enter; break;
										case input.SE: v = vk_backspace; break;
										case input.JU: v = vk_numpad5; break;
										case input.SL: v = vk_numpad4; break;
										case input.SH: v = vk_numpad6; break;
										case input.PA: v = vk_numpad0; break;
									}
								}
							} else {
								if (d == GP) {
									switch i {
										case input.L: v = ord("A"); break;
										case input.D: v = ord("S"); break;
										case input.U: v = ord("W"); break;
										case input.R: v = ord("D"); break;
										case input.ST: v = ord("1"); break;
										case input.SE: v = ord("2"); break;
										case input.JU: v = ord("C"); break;
										case input.SL: v = ord("F"); break;
										case input.SH: v = ord("G"); break;
										case input.PA: v = ord("H"); break;
									}
								} else if (d == GP+1) {
									switch i {
										case input.L: v = ord("J"); break;
										case input.D: v = ord("K"); break;
										case input.U: v = ord("I"); break;
										case input.R: v = ord("L"); break;
										case input.ST: v = ord("7"); break;
										case input.SE: v = ord("8"); break;
										case input.JU: v = 186; break;
										case input.SL: v = 219; break;
										case input.SH: v = 221; break;
										case input.PA: v = 220; break;
									}
								}
							}
							if (e == 0) global.mainbind[device][i] = v;
							else global.subbind[device][i] = v;
						}
					}
				}
			}
		}
	}
	if (global.lookup[p] == GP+KB) ready[p]=true;
}

if (ready[0] && ready[1]) instance_destroy();
