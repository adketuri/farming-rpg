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
draw_text_color(name_text_x, name_text_y, name, c, c, c, c, 1);
draw_set_halign(fa_left); draw_set_valign(fa_top);

// Draw text
c = text_col;
draw_text_ext_color(text_x, text_y, text[page], text_height, text_width, c, c, c, c, 1);