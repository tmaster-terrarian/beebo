if hp
{
    instance_destroy(other)
    event_perform(ev_other, ev_user0)
    flash = 5
    hp--
}
