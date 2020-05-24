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
			"No, that's not me."
		],
	"Are you feeling okay?",
	"I must be mistaken then."
];
speakers = [id, o_player, id, o_player, id, id];
next_line = [0, 0, 0, [4, 5], -1, -1];