// Time till gas starts rising
timer_seconds = 120; 

// Seconds to fps
gas_timer = timer_seconds * game_get_speed(gamespeed_fps);

// Event only happens once and doesn't repeat
is_gas_rising = false;

