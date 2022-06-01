if (!surface_exists(surf)) {
	surf = surface_create(room_width,room_height);
}
if (!surface_exists(surf2)) {
	surf2 = surface_create(room_width,room_height);
	do_scanline = true;
}


if (do_scanline) {
		with (obj_wall) {
		if (surface_exists(obj_surface.surf2)) {
			surface_set_target(obj_surface.surf2);
			//draw_set_alpha(0.005);
			//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
			for (var i = bbox_top; i < bbox_bottom; i++) {
				if (i mod 2 == 0) {
							//draw_set_alpha(0.004);
					draw_line(bbox_left,i,bbox_right,i);
				} 
			}
			//for (var i = bbox_top; i < bbox_bottom; i++) {
			//	if (i mod 3 == 0) {
			//				draw_set_alpha(0.004);
			//		draw_line(bbox_left,i,bbox_right,i);
			//	} 
			//}
			//for (var i = bbox_left; i < bbox_right; i++) {
			//	if (i mod 3 == 0) {
			//				draw_set_alpha(0.004);
			//		draw_line(i,bbox_top,i,bbox_bottom);
			//	} 
			//}
			surface_reset_target();
			//draw_set_alpha(1);
		}
	}
	surface_save(surf2, "surf3.png");
	do_scanline = false;
}

surface_set_target(surf);
draw_surface_ext(surf2,0,0,1,1,0,c_white,0.005);
surface_reset_target();
draw_surface(surf,0,0);
