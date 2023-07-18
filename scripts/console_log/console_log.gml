function console_log(txt)
{
    gm.log_str = string_insert("\n" + string(txt) + "[/c]", gm.log_str, string_length(gm.log_str) + 1);
    debug_log("console", scribble(txt).get_text())
}
