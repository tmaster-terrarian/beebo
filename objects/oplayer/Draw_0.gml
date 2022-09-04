with (oGun)
{
    x = other.x;
    y = other.y + 3;

    x -= lengthdir_x(recoil, image_angle);
    y -= lengthdir_y(recoil, image_angle);
}

draw_self();

if(flash > 0)
{
    flash--;
    shader_set(shWhite);
    shader_set_uniform_f(upixelW, texelW);
    shader_set_uniform_f(upixelH, texelH);
    draw_self();
    shader_reset();
}
