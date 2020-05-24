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
draw_text_color(name_text_x, name_text_y, name, c, c, c_teal, c_teal, 1);
draw_set_halign(fa_left); draw_set_valign(fa_top);

// Draw text
if (!choice_dialogue){
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
} else {
	var text_array = text[page];
	c = text_col;
	var y_add = 0;
	var i = 0; 
	repeat(text_array_len) {
		if (choice == i){
			c = c_yellow;
			draw_set_alpha(0.1);
			draw_rectangle_color(text_x - 2, text_y + y_add, text_x + text_width - 2, text_y + y_add + string_height_ext(text_array[i], text_height, text_width) - 2, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		} else {
			c = c_white;
		}
		draw_text_ext_color(text_x + 1, text_y + 1 + y_add, text_array[i], text_height, text_width, c_black, c_black, c_black, c_black, 1);
		draw_text_ext_color(text_x, text_y + y_add, text_array[i], text_height, text_width, c, c, c_gray, c_gray, 1);
		y_add += string_height_ext(text_array[i], text_height, text_width)
		i++;
	}
		
}