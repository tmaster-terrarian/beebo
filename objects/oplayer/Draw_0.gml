draw_self();

if(instance_exists(oGun))
{
    draw_sprite_ext(oGun.sprite_index, oGun.image_index, x + gun_offs_x - lengthdir_x(oGun.recoil, oGun.image_angle), y + gun_offs_y - lengthdir_y(oGun.recoil, oGun.image_angle), oGun.image_xscale, oGun.image_yscale, oGun.image_angle, c_white, 1);
}

if(flash > 0)
{
    flash--;
    shader_set(shWhite);
    shader_set_uniform_f(upixelW, texelW);
    shader_set_uniform_f(upixelH, texelH);
    draw_self();
    shader_reset();
}
