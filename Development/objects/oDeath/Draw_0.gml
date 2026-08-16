draw_self();

draw_set_font(fTitle);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_colour(x, y, "You Died", c_red, c_red, c_red, c_red, 1);

draw_set_font(fNormal);
draw_text_colour(x, y + 48, "Press [esc] to restart", c_red, c_red, c_red, c_red, 1);

draw_set_font(fNormal);
draw_text(x, y - 180, "Miners Saved; " + string(global.minerSaved)+ "\n\nMonsters Killed; " + string(global.monstersKill));





