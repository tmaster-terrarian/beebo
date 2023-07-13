function wrap_int(_value, _min, _max)
{
	var __value = floor(_value);
	var __min = floor(min(_min, _max));
	var __max = floor(max(_min, _max));
	var __range = __max - __min + 1; // + 1 is because max bound is inclusive
	
	return (((__value - __min) % __range) + __range) % __range + __min;
}
