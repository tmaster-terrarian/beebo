draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_dos);

if(anim_timer >= 200)
{
    draw_text_transformed(t_pad_x, t_pad_y, "CS Soup BIOS v3.1, A Skellio Industries Ally", t_scale, t_scale, 0);
}
if(anim_timer >= 201)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size, "Copywrite (C) 1985-95 who cares, lmao", t_scale, t_scale, 0);
}

if(anim_timer >= 205)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 3, "#401A0-0207", t_scale, t_scale, 0);
}

if(anim_timer >= 210)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 5, "SUPER MEGA CPU EXTREME at 2KHz", t_scale, t_scale, 0);
}
if(anim_timer >= 340)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 6, "Memory Test :                3B OK", t_scale, t_scale, 0);
}

if(anim_timer >= 400)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 8, "CS Soup Piracy Bypass Extention v1.0", t_scale, t_scale, 0);
}
if(anim_timer >= 450)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 8, "CS Soup Piracy Bypass Extention v1.0 (tm)", t_scale, t_scale, 0);
}

if(anim_timer >= 460)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 11, "Initialize Contraband Piracy Cartridge...", t_scale, t_scale, 0);
}
if(anim_timer >= 680)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 12, "Cartridge Init Completed", t_scale, t_scale, 0);
}

if(anim_timer >= 850) && (anim_timer < 950)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 14, "Detecting HDD Primary Master   ... [Press Enter to skip]", t_scale, t_scale, 0);
}
if(anim_timer >= 950)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 14, "Detecting HDD Primary Master   ... BenbOS BuiltIn 256MB", t_scale, t_scale, 0);
}
if(anim_timer >= 960) && (anim_timer < 1120)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 15, "Detecting HDD Primary Slave     ... [Press Enter to skip]", t_scale, t_scale, 0);
}
if(anim_timer >= 1120)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 15, "Detecting HDD Primary Slave     ... None", t_scale, t_scale, 0);
}
if(anim_timer >= 1121) && (anim_timer < 1130)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 16, "Detecting HDD Secondary Master... [Press Enter to skip]", t_scale, t_scale, 0);
}
if(anim_timer >= 1130)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 16, "Detecting HDD Secondary Master... None", t_scale, t_scale, 0);
}
if(anim_timer >= 1131) && (anim_timer < 1135)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 17, "Detecting HDD Secondary Slave  ... [Press Enter to skip]", t_scale, t_scale, 0);
}
if(anim_timer >= 1135)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 17, "Detecting HDD Secondary Slave  ... None", t_scale, t_scale, 0);
}

if(anim_timer >= 1150)
{
    draw_text_transformed(t_pad_x, t_pad_y + t_line_size * 19, "Boot Completed : Press Enter or Spacebar to continue", t_scale, t_scale, 0);
}
