function gamepad_button_check_any(gp = 0)
{
    for(var i = 0; i < 16; i++)
    {
        if(gamepad_button_check(gp, i + 32769) || gamepad_axis_value(0, gp_axislh) != 0 || gamepad_axis_value(0, gp_axislv) != 0 || gamepad_axis_value(0, gp_axisrh) != 0 || gamepad_axis_value(0, gp_axisrv) != 0)
        {
            return 1
        }
        else continue
    }
    return 0
}
function gamepad_button_check_any_pressed(gp = 0)
{
    for(var i = 0; i < 16; i++)
    {
        if(gamepad_button_check_pressed(gp, i + 32769) || gamepad_axis_value(0, gp_axislh) != 0 || gamepad_axis_value(0, gp_axislv) != 0 || gamepad_axis_value(0, gp_axisrh) != 0 || gamepad_axis_value(0, gp_axisrv) != 0)
        {
            return 1
        }
        else continue
    }
    return 0
}
function gamepad_button_check_any_released(gp = 0)
{
    for(var i = 0; i < 16; i++)
    {
        if(gamepad_button_check_released(gp, i + 32769) || gamepad_axis_value(0, gp_axislh) != 0 || gamepad_axis_value(0, gp_axislv) != 0 || gamepad_axis_value(0, gp_axisrh) != 0 || gamepad_axis_value(0, gp_axisrv) != 0)
        {
            return 1
        }
        else continue
    }
    return 0
}
