//textVal = "use";
key_icon = noone;
normal = true;
depo = false;
//draw_sprite(key_icon, 0, x, y);
parentX = x;
parentY = y;
//draw_text(x + sprite_width + 5, y, textVal);
drawX = (parentX - camera_get_view_x(view_camera[0])) * 4;
drawY = (parentY - camera_get_view_y(view_camera[0])) * 4;

left = true;