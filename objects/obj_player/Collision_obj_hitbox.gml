/// @description Insert description here
// You can write your code in this editor

if (other.team != team && (collision_line(x, y, other.x, other.y, obj_wall, false, false) == noone || other.object_index == obj_wallbang))  {
	if (state == status.parry) {
		invul += 5;
		spark = instance_create_layer(x, y, "parryfx", obj_parry);
		spark.owner = id;
		spark.direction = point_direction(x,y,other.x,other.y);
		spark.image_angle = spark.direction;
		audio_play_sound(snd_parry, 1, false);
		reflectx = x;
		reflecty = y;
		if (other.object_index == obj_anchor) {
			reflected = other.owner;
			superreflect = true;
			counterspeed = other.spd < 32 ? 32 : other.spd;
			if (global.hitstop <  9 * counterspeed / 32) global.hitstop = 9 * counterspeed / 32;
		} else if (other.object_index == obj_bullet || object_is_ancestor(other.object_index, obj_bullet)) {
			superreflect = false;
			reflected = other.owner;
			counterspeed = other.spd < 32 ? 32 : other.spd;
			if (global.hitstop < clamp(9 * counterspeed / 32,0,60)) global.hitstop = clamp(9 * counterspeed / 32,0,60);
			reflectx = other.x;
			reflecty = other.y;
		}
		else {
			other.owner.state = status.parried;
			other.owner.recovery = parrystop;
			if (global.hitstop < 16) global.hitstop = 16;
		}
		global.outline = color;
		depth = layerdepth;
		other.owner.depth = layerdepth + 1;
		
		var _list = ds_list_create();
		var _num = instance_place_list(x, y, obj_hitbox, _list, false);
		if _num > 0
		{
		    for (var i = 0; i < _num; ++i;)
		    {
		        instance_destroy(_list[| i]);
		    }
		}
		ds_list_destroy(_list);
		if (_num > 2) {
			state = status.parry;
			recovery = 1;
		}
		else {
			state = status.idle;
		}
		



	} else if (invul <= 0) {
		deaths += 1;
		instance_create_layer(x, y, "hitboxes", obj_boom);
		audio_play_sound(snd_dies, 1, false);
		spawning = spawntime;
		depth = layer_get_depth("trails") + 1;
		other.owner.depth = layerdepth - 1;
		if (global.hitstop < 20) global.hitstop = 20;
		global.outline = color;
		if (deaths == global.firstto) {
			if (global.hitstop < 120) global.hitstop = 120;
			ultradies = audio_play_sound(snd_dies, 1, false);
			audio_sound_pitch(ultradies, 20/120);
		}
		spawnpoint = instance_furthest(other.owner.x, other.owner.y, obj_respawn);
		invul = invultime;
		
		for (i = 0; i < 250; i++) {
			trail = instance_create_layer(x, y, "hitboxes", obj_glitter);
			trail.depth -= 2;
			trail.image_blend = color;
			if (irandom(1)) trail.image_blend = c_white;
			trail.speed = random(5);
			trail.image_index = random(8);
			trail.friction = 0.25;
			trail.direction = random(360);
			trail.gravity = random_range(0.1, 0.3);
			trail.gravity_direction = other.direction;
			trail.x = random_range(bbox_left, bbox_right);
			trail.y = random_range(bbox_bottom, bbox_top);
			trail.scale = random_range(1,2);
		}
		//trail = instance_create_layer(x,y,"trails",obj_burst);
		//trail.depth -= 1;
		//trail.image_blend = color;
		//trail.image_angle = other.direction;
		
		for (i = 0; i < 60; i++) {
			trail = instance_create_layer(x,y,"platforms",obj_splatter);
			trail.depth += 2;
			trail.radius = random_range(1,30);
			trail.timer = random(i);
			trail.image_blend = irandom(3) ? color : global.fgcolor2;
			trail.image_alpha = random_range(0.6,0.8);
			trail.x = random_range(bbox_left, bbox_right);
			trail.y = random_range(bbox_bottom, bbox_top);
			rdir = 0;
			rdir += other.direction + random_range(-15, 15);
			
			trail.speed = random(global.hitstop);
			trail.direction = rdir;
			trail.friction = trail.speed / global.hitstop;
			rlen = random_range(0,500);
			trail.x += lengthdir_x(rlen,rdir);
			trail.y += lengthdir_y(rlen,rdir);
		}

	} else {
		instance_destroy(other);
		freeze = 2;
		if (global.hitstop < freeze) global.hitstop = freeze;
		global.outline = global.fgcolor2;
		flash = true;
	}
}