if(noise_sp > 0)
{
	noise_x += noise_sp
	if(noise_x >= 512)
		noise_x = 0

	noise_y += noise_sp
	if(noise_y >= 512)
		noise_y = 0
}
