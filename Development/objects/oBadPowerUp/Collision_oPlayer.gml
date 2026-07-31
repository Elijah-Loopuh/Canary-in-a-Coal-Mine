oPlayer.doubleJMP = -1; //dewactivate double jump
oPlayer.dashCooldown = oPlayer.dashCooldownMaster + 10; //deactivate dashing
oPlayer.max_hp = 5;
oPlayer.hp = oPlayer.max_hp;
oPlayer.minerscore = 0;
oPlayer.minercapacity = 3;

oTimer.gas_timer = oTimer.timer_seconds * game_get_speed(gamespeed_fps);

instance_destroy();