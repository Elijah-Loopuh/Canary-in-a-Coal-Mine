oCanary.sprite_index = sNoCollision
oPlayer.sprite_index = sNoCollision
oPicAxe.sprite_index = sNoCollision
oPlayer.x = 10
oPlayer.y = 10
if keyboard_check_pressed(vk_f8) 
{ 
	window_set_fullscreen( !window_get_fullscreen() )	
}
if keyboard_check_pressed(vk_escape)
{ 
	game_restart();
}

