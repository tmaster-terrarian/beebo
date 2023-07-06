/// Creates a collection of colour names that map to 24-bit BGR colours
/// Use scribble_rgb_to_bgr() to convert from industry standard RGB colour codes to GM's native BGR format
/// 
/// To add or change colours at runtime, use scribble_color_set()
/// 
/// N.B. That this function is executed on boot. You should never execute this function yourself!

function __scribble_config_colours()
{
    static _colours = {
        //Duplicate GM's native colour constants
        c_aqua:    c_aqua,
        c_black:   c_black,
        c_blue:    c_blue,
        c_dkgray:  c_dkgray,
        c_dkgrey:  c_dkgrey,
        c_fuchsia: c_fuchsia,
        c_gray:    c_gray,
        c_green:   c_green,
        c_gray:    c_gray,
        c_grey:    c_grey,
        c_lime:    c_lime,
        c_ltgray:  c_ltgray,
        c_ltgrey:  c_ltgrey,
        c_maroon:  c_maroon,
        c_navy:    c_navy,
        c_olive:   c_olive,
        c_orange:  c_orange,
        c_purple:  c_purple,
        c_red:     c_red,
        c_silver:  c_silver,
        c_teal:    c_teal,
        c_white:   c_white,
        c_yellow:  c_yellow,
    
        //Here are some example colours
        c_coquelicot: scribble_rgb_to_bgr(0xff3800),
        c_smaragdine: scribble_rgb_to_bgr(0x50c875),
        c_xanadu:     scribble_rgb_to_bgr(0x738678),
        c_amaranth:   scribble_rgb_to_bgr(0xe52b50),

        rc_none:		#798686,
        rc_common:		#E8F6F4,
        rc_rare:		#38EB73,
        rc_legendary:   #F3235E,
        rc_special:		#D508E5,
		
		kw_health:		#00cc43,
		kw_damage:		#ee0077,
		kw_projectile:	#e5c313,
		kw_number:		#e8d782,
		kw_proctype:	#a6f1d1,
		kw_downside:	#ff0055,
    };

    return _colours;
}
