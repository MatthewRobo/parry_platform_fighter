/// @description Insert description here
// You can write your code in this editor

instance_destroy(trail);
	trail = instance_create_layer(x, y, "trails", obj_slashdead);
	trail.image_angle = direction;
	trail.image_blend = owner.color;