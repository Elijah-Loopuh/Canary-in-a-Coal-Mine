draw_self();

draw_set_font(fMedium);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y - 256, "You Escaped The Mines!");

draw_set_font(fNormal);
draw_text(x, y - 180, "Total Points; " + string(oPlayer.totalscore) + "\n\nMiners Collected; " + string((oPlayer.totalminers / global.totalMiners) * 100) + "%\n\nMonsters Killed; " + string((oPlayer.monstersKill/global.totalEnemies)*100) + "%");

show_debug_message(oPlayer.totalminers);
show_debug_message(global.totalMiners);
show_debug_message("");
show_debug_message(oPlayer.monstersKill);
show_debug_message(global.totalEnemies);






