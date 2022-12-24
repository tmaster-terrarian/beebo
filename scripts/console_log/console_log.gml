function console_log(txt)
{
    log_str = string_insert("\n" + string(txt), log_str, string_length(log_str) + 1);
}
