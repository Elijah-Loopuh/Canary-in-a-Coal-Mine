if(oPlayer.minerscore >= ammountneeded)
{
	oPlayer.minerscore -= ammountneeded;
 	oTimer.gas_timer += 30 * 60;
	ammountneeded += 5;
}