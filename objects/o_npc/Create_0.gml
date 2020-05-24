/// @description Insert description here
event_inherited()

sprite_sheet = s_npc

portrait_index = 4;
voice_pitch = 0.7;
name = "Clydan";
text = [
	"Amalia! What are you doing here?", 
	"Er, Ama-what?", 
	"Amalia! That's your name, right?", 
		[
			"I think so. Have we met before? Your face looks familiar, but I don't know.",
			"Who are you?"
		],
	"Are you feeling okay?",
	"Oh you must not recognize me in this form. How about now?",
];
speakers = [id, o_player, id, o_player, id, id];
next_line = [0, 0, 0, [4, 5], -1, -1];

scripts = [
	-1,
	-1,
	-1,
	[
		-1,
		[change_variable, id, "sprite_sheet", s_clydan]
	],
	-1,
	-1,
];