/// @description Move player and handle collisions

// poll keyboard input
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);

// alter speed
spd = SPEED
if (input_walk xor input_run) {
	spd = abs((input_walk*WALK_SPEED) - (input_run*RUN_SPEED));
} 

// set intended movement
moveX = 0
moveY = 0
moveX = (input_right - input_left) * spd / room_speed;
if (moveX == 0) {
	moveY = (input_down - input_up) * spd / room_speed;
}

// TODO do collision check

// apply movement
x += moveX;
y += moveY;