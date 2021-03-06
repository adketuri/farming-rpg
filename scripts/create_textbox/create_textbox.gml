///@description create_textbox
///@arg text
///@arg speakers
///@arg next_line
///@arg scripts

var tbox = instance_create_layer(0, 0, "Text", o_textbox);
with (tbox){
	text = argument0;
	speakers = argument1;
	next_line = argument2;
	scripts = argument3;
	
	var len = array_length_1d(text);
	var i = 0; repeat(len){
		names[i] = speakers[i].name;
		portraits[i] = speakers[i].portrait_index;
		voices[i] = speakers[i].voice_pitch;
		i++;
	}
	event_perform(ev_other, ev_user1);
}
return tbox;