if(oPlayer.minerscore >= ammountneeded)
{
	oPlayer.minerscore -= ammountneeded;
 	oTimer.gas_timer += 2 * 60 * 60;
	ammountneeded += 5;
}