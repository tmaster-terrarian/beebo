//check neighbors and update sprite accordingly

cn = function(_posx, _posy) //check neighbor 'macro'(?)
{
    return (place_meeting(x + _posx * 16, y + _posy * 16, obj_wall) && !place_meeting(x + _posx * 16, y + _posy * 16, oCrate));
}

if(cn(0, 1) && cn(-1, 0) && cn(1, 0) && cn(0, -1) && cn(1, 1) && cn(1, -1) && cn(-1, 1) && cn(-1, -1)) image_index = 0; //center

else if(cn(1, 0) && cn(-1, 0) && cn(0, 1) && !cn(0, -1)) image_index = 1; //top edge
else if(cn(1, 0) && cn(-1, 0) && cn(0, -1) && !cn(0, 1)) image_index = 2; //bottom edge
else if(cn(0, 1) && cn(0, -1) && cn(1, 0) && !cn(-1, 0)) image_index = 3; //left edge
else if(cn(0, 1) && cn(0, -1) && cn(-1, 0) && !cn(1, 0)) image_index = 4; //right edge

else if(cn(1, 0) && cn(0, 1) && !cn(-1, 0) && !cn(0, -1)) image_index = 5; //top left corner
else if(cn(-1, 0) && cn(0, 1) && !cn(1, 0) && !cn(0, -1)) image_index = 6; //top right corner
else if(cn(1, 0) && cn(0, -1) && !cn(-1, 0) && !cn(0, 1)) image_index = 7; //bottom left corner
else if(cn(-1, 0) && cn(0, -1) && !cn(1, 0) && !cn(0, 1)) image_index = 8; //bottom right corner

else if(cn(0, 1) && !cn(0, -1) && !cn(1, 0) && !cn(-1, 0)) image_index = 9;  //top thin
else if(cn(0, -1) && !cn(0, 1) && !cn(1, 0) && !cn(-1, 0)) image_index = 10; //bottom thin
else if(cn(-1, 0) && !cn(0, -1) && !cn(1, 0) && !cn(0, 1)) image_index = 11; //left thin
else if(cn(1, 0) && !cn(0, -1) && !cn(-1, 0) && !cn(0, 1)) image_index = 12; //right thin

else if(cn(0, -1) && cn(0, 1) && !cn(-1, 0) && !cn(1, 0)) image_index = 13; //vertical thin
else if(cn(-1, 0) && cn(1, 0) && !cn(0, -1) && !cn(0, 1)) image_index = 14; //horizontal thin

else image_index = 0; //fallback to default just in case
