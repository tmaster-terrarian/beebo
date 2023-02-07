switch(tl_pos)
{
    case 0:
        tl_go = 0
    break
}

if(tl_go) tl_pos++;

lod_f += 0.25
ico_f += 0.2
if(lod_f > 29) lod_f = 0
if(ico_f > 29) ico_f = 0

tip_x += floor((tip_xt - tip_x) / 12);
txt_x = tip_x + 20
txt_y = tip_y + 21
