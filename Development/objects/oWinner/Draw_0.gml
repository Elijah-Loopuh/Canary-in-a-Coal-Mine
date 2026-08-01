draw_self();

draw_set_font(fMedium);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y - 256, "You Escaped The Mines!");

draw_set_font(fNormal);
draw_text(x, y - 180, "Total Points; " + string(oPlayer.totalscore) + "\n\nMiners Collected; " + string(oPlayer.totalminers) + "\n\nMonsters Killed; " + string(oPlayer.monstersKill))






