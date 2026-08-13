// Inherit the parent event
event_inherited();
randomize();
vDebug = false

room_goto(rTutorialRoom);

oGlobalFunctions.doTutorial = false;

layer_set_visible(layer_get_id("PlayerScoreUI"), true);