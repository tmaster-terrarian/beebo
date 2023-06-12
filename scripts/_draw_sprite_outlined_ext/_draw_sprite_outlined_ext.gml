function draw_sprite_outlined(spr, subimg, _x, _y, outlincol = c_white, outlinalpha = 1, square = 0)
{
	shader_set(sh_flash)
	draw_sprite_ext(spr, subimg, _x + 1, _y, 1, 1, 0, outlincol, outlinalpha)
	draw_sprite_ext(spr, subimg, _x - 1, _y, 1, 1, 0, outlincol, outlinalpha)
	draw_sprite_ext(spr, subimg, _x, _y + 1, 1, 1, 0, outlincol, outlinalpha)
	draw_sprite_ext(spr, subimg, _x, _y - 1, 1, 1, 0, outlincol, outlinalpha)
	if(square)
	{
		draw_sprite_ext(spr, subimg, _x + 1, _y + 1, 1, 1, 0, outlincol, outlinalpha)
		draw_sprite_ext(spr, subimg, _x - 1, _y + 1, 1, 1, 0, outlincol, outlinalpha)
		draw_sprite_ext(spr, subimg, _x + 1, _y - 1, 1, 1, 0, outlincol, outlinalpha)
		draw_sprite_ext(spr, subimg, _x - 1, _y - 1, 1, 1, 0, outlincol, outlinalpha)
	}
	shader_reset()

	draw_sprite_ext(spr, subimg, _x, _y, 1, 1, 0, draw_get_color(), draw_get_alpha())
}

function draw_sprite_outlined_ext(spr, subimg, _x, _y, xscale = 1, yscale = 1, rot = 0, col = c_white, outlincol = c_white, alpha = 1, outlinalpha = 1, square = 0)
{
	shader_set(sh_flash)
	draw_sprite_ext(spr, subimg, _x + 1, _y, xscale, yscale, rot, outlincol, outlinalpha)
	draw_sprite_ext(spr, subimg, _x - 1, _y, xscale, yscale, rot, outlincol, outlinalpha)
	draw_sprite_ext(spr, subimg, _x, _y + 1, xscale, yscale, rot, outlincol, outlinalpha)
	draw_sprite_ext(spr, subimg, _x, _y - 1, xscale, yscale, rot, outlincol, outlinalpha)
	if(square)
	{
		draw_sprite_ext(spr, subimg, _x + 1, _y + 1, xscale, yscale, rot, outlincol, outlinalpha)
		draw_sprite_ext(spr, subimg, _x - 1, _y + 1, xscale, yscale, rot, outlincol, outlinalpha)
		draw_sprite_ext(spr, subimg, _x + 1, _y - 1, xscale, yscale, rot, outlincol, outlinalpha)
		draw_sprite_ext(spr, subimg, _x - 1, _y - 1, xscale, yscale, rot, outlincol, outlinalpha)
	}
	shader_reset()

	draw_sprite_ext(spr, subimg, _x, _y, xscale, yscale, rot, col, alpha)
}
