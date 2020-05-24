if (keyboard_check_pressed(interact_key) || mouse_check_button_pressed(mb_left)) {
	if (counter < str_len) {
		counter = str_len;	
	} else if (page < array_length_1d(text) - 1) {
		page++;	
		event_perform(ev_other, ev_user1);
	} else {
		instance_destroy();
	}
}

if (choice_dialogue){
	choice += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	if (choice > text_array_len - 1){
		choice = 0;	
	} else if (choice < 0){
		choice = text_array_len - 1;	
	}
}