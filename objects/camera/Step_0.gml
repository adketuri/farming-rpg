/// @description Move the camera independently
x += (x_to - x) / 10;
y += (y_to - y) / 10;

if (following != noone) {
	x_to = clamp(x, following.x - h_border, following.x + h_border);
	y_to = clamp(y, following.y - v_border, following.y + v_border);
}
