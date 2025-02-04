/// @description Insert description here
// You can write your code in this editor

randomize();

#macro PLAYERS 4
#macro GP 12
#macro KB 2

#macro GREYBOX false

enum input {
	U = 0,
	D,
	L,
	R,
	SL,
	SH,
	PA,
	JU,
	ST,
	SE,
	length
}

enum gamemode {
	versus,
	teamvs,
	training
}

var roomlist = ds_list_create();
var i = 1;
var roomlen = 0;
var index = 0;
while (true) {
	index = asset_get_index("Room" + string(i));
	show_debug_message("Room" + string(i) + " : " + string(index));
	if (index == -1) break;
	else {
		ds_list_add(roomlist, index);
		roomlen++;
	}
	i++;
}

global.rooms = array_create(roomlen, -1);
for (var i = 0; i < roomlen; i++) {
	global.rooms[i+1] = roomlist[| i];
}
ds_list_destroy(roomlist);
//global.rooms = [-1,Room1,Room2,Room3,Room4,Room5,Room6,Room7,Room8,Room9,Room10,Room11,Room12];
global.banlist = array_create(array_length(global.rooms),false);
global.takess = false;
global.stage = Room0;
global.stageindex = 0;
global.stagename = "";

global.paused = false;
global.parrybuffer = 0;
global.gpnum = 12;
global.gp = array_create(global.gpnum, -99);

global.shots = array_create(PLAYERS, 0);
global.shots[1] = shot.whiffpunisher;
global.shots[2] = shot.wallbang;
global.shots[3] = shot.grenade;

global.shotsspr = array_create(PLAYERS, -1);
global.shotsstr = array_create(PLAYERS, "");

global.lookup = array_create(PLAYERS, GP+KB);

// input.length[player][input]
global.down     = array_create(GP+KB+1,array_create(input.length,0));
global.last     = array_create(GP+KB+1,array_create(input.length,0));
global.pressed  = array_create(GP+KB+1,array_create(input.length,0));
global.released = array_create(GP+KB+1,array_create(input.length,0));

global.mode = gamemode.versus;

room_goto_next();

global.color = array_create(4,0);
global.color[0] = $5100ff;
global.color[1] = $ff8000;
global.color[2] = c_orange;
global.color[3] = c_teal;
//color = $0dff00;
//color = $ff0033;
//color = $d000ff

global.bgcolor = $1d1616;
global.textcolor = c_white;

for (var d = 0; d < GP; d++) {
	gamepad_set_axis_deadzone(d,0.40);
}

if (os_browser == browser_not_a_browser)
{
    global.browser = false;
}
else
{
    global.browser = true;
}

global.mainbind = array_create(GP + KB+1, array_create(input.length, -1));
global.subbind = array_create(GP + KB+1, array_create(input.length, -1));

global.inassign = false;
global.insettings = false;
global.pmax = 2;
