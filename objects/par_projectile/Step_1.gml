if(max_instances && instance_number(object_index) > max_instances)
{
	proc = 0
	damage = 0
	instance_destroy()
}

if(lifetime)
	lifetime--
if(lifetime == 0)
{
	instance_destroy()
}
