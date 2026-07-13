if(!is_gas_rising)
{
	gas_timer--;
	
	if(gas_timer <=0)
	{
		is_gas_rising = true
	}
	
	show_debug_message("It feels like it's harder to breath.");
}