event_inherited();

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

hp = 1;
flash = 0;

item = noone;

cn = function(_posx, _posy) //check neighbor 'macro'(?)
{
    return (place_meeting(x + _posx * 16, y + _posy * 16, oWall) && !place_meeting(x + _posx * 16, y + _posy * 16, oCrate));
}

if(cn(-1, 1) && cn(0, 1) && cn(1, 1) && cn(-1, 0) && cn(1, 0) && cn(-1, -1) && cn(0, -1) && cn(1, -1)) image_index = 0; //center

else if(cn(1, 0) && cn(-1, 0) && cn(0, 1) && !cn(0, -1)) image_index = 1; //top edge
else if(cn(1, 0) && cn(-1, 0) && cn(0, -1) && !cn(0, 1)) image_index = 2; //bottom edge
else if(cn(0, 1) && cn(0, -1) && cn(1, 0) && !cn(-1, 0)) image_index = 3; //left edge
else if(cn(0, 1) && cn(0, -1) && cn(-1, 0) && !cn(1, 0)) image_index = 4; //right edge

else if(cn(1, 0) && cn(0, 1) && !cn(-1, 0) && !cn(0, -1)) image_index = 5; //top left corner
else if(cn(-1, 0) && cn(0, 1) && !cn(1, 0) && !cn(0, -1)) image_index = 6; //top right corner
else if(cn(1, 0) && cn(0, -1) && !cn(-1, 0) && !cn(0, 1)) image_index = 7; //bottom left corner
else if(cn(-1, 0) && cn(0, -1) && !cn(1, 0) && !cn(0, 1)) image_index = 8; //bottom right corner

else image_index = 0; //fallback to default just in case

