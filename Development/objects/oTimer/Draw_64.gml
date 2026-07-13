// Seconds from Frames
var _total_seconnds = max(0, gas_timer / game_get_speed(gamespeed_fps));
var _minnutes = floor(_total_seconds / 60);
var _seconds = floor(_total_seconds mod 60);

// Format
var _time_string = string(_minutes) + ":" + ((_seconds < 10) ? "0" : "") + String(_seconds)

// Alignment and Font
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Drawing from top center
var _gui_x + display_get_gui_width() / 2;
var _gui_y = 20
draw_text(_gui_x, _gui_y, "Gas Rising In: " + _time_string);

// Reset Alignment so no Overlap
draw_set_halign(fa_left);
draw_set_valign(fa_top);