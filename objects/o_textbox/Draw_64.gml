/// @description draw message


// Draw box
draw_sprite(box, 0, box_x, box_y);

// Draw namebox
draw_sprite(namebox, 0, namebox_x, namebox_y);

// Draw portrait
draw_sprite(portrait, portrait_index, portrait_x, portrait_y);

// TEXT 
draw_set_font(font);

// Draw name
var c = name_text_col;
draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_text_color(name_text_x + 1, name_text_y + 1, name, c_black, c_black, c_black, c_black, 1);
draw_text_color(name_text_x, name_text_y, name, c, c, c, c, 1);
draw_set_halign(fa_left); draw_set_valign(fa_top);

// Draw text
if (!pause && counter < str_len) {
	counter += delta_time / 15000;
	sound_counter += 1;
	if (sound_counter mod 6 == 0) {
		var talk = audio_play_sound(snd_talk, 10, false);
		audio_sound_pitch(talk, voice_pitch);
	}
	switch (string_char_at(text_wrapped, counter)){
		case ",": 
			pause = true;
			alarm[1] = 10;
			break;	
		case ".":	
		case "?":	
		case "!": 
			pause = true;
			alarm[1] = 20;
			break;	
	}
}
var substr = string_copy(text_wrapped, 1, floor(counter));
c = text_col;
draw_text_color(text_x + 1, text_y + 1, substr, c_black, c_black, c_black, c_black, 1);
draw_text_color(text_x, text_y, substr, c, c, c_gray, c_gray, 1);