function MakeExplosion(_x, _y, _scale_x = 1, _scale_y = 1, _anim_speed = 1, _sound = sn_explosion, _depth = 50)
{
	var obj = instance_create_depth(_x, _y, _depth, obj_explosion);
	obj.image_xscale = _scale_x;
	obj.image_yscale = _scale_y;
	obj.image_speed = _anim_speed;
	if(_sound)
		audio_play_sound(_sound, 1, false);
	return obj;
}
