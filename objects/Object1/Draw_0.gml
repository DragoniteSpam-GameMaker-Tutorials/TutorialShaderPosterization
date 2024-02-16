if (keyboard_check_pressed(vk_up)) level++;
if (keyboard_check_pressed(vk_down)) level = max(1, --level);
if (keyboard_check_pressed(vk_right)) index = ++index % array_length(images);
if (keyboard_check_pressed(vk_left)) index = (--index + array_length(images)) % array_length(images);

shader_set(shd_posterization);
var uniform_posterization = shader_get_uniform(shd_posterization, "posterization_level");
shader_set_uniform_f(uniform_posterization, level);
draw_sprite(images[index], 0, 0, 0);
shader_reset();

draw_rectangle_colour(0, 0, 400, 56, c_white, c_white, c_white, c_white, false);
draw_text_colour(32, 12, $"FPS: {fps}", c_black, c_black, c_black, c_black, 1);
draw_text_colour(32, 28, $"Posterization level: {level}", c_black, c_black, c_black, c_black, 1);