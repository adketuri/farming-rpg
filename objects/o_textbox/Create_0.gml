box = s_textbox;
portrait = s_portraits;
namebox = s_namebox;

pad = 5;
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

portrait_x = (global.game_width - box_width - port_width / 2) * 0.5;
portrait_y = global.game_height - port_height;
box_x = portrait_x + port_width / 2;
box_y = global.game_height - box_height - pad;
namebox_x = portrait_x + port_width / 2;
namebox_y = box_y - namebox_height;

portrait_index = 0;