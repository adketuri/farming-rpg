name = names[page];
voice_pitch = voices[page];
portrait_index = portraits[page];

text_wrapped = string_wrap(text[page], text_width);
str_len = string_length(text_wrapped);
counter = 0;
sound_counter = 0;