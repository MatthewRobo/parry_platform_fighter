/// @description Insert description here
// You can write your code in this editor

draw_set_colour(global.outline);
if (abs(global.hitstop - global.peakstop) < 2) draw_set_color(global.fgcolor2);
if (!GREYBOX) {
draw_set_alpha(1)
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x11-w0,y11-w0);
draw_vertex(x21+w0,y12-w0);
draw_vertex(x12-w0,y21+w0);
draw_vertex(x22+w0,y22+w0);
draw_primitive_end();



if (global.hitstop <= 0) draw_set_colour(global.fgcolor2);

draw_set_alpha(1);
draw_rectangle(x1-_w0, y1-_w0, x2+_w0, y2+_w0, 0);
}


