// Seconds from Frames
var _total_seconds = max(0, gas_timer / game_get_speed(gamespeed_fps));
var _minutes = floor(_total_seconds / 60);
var _seconds = floor(_total_seconds mod 60);

// Format
var _time_string = string(_minutes) + ":" + ((_seconds < 10) ? "0" : "") + string(_seconds)

// Self Draw
draw_self();

// Alignment and Font
draw_set_font(fNormal);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Drawing from top center
draw_text(x, y, "Gas Rising In: " + _time_string);

// Reset Alignment so no Overlap
draw_set_halign(fa_left);
draw_set_valign(fa_top);