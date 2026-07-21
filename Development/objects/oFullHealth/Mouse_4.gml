if(oPlayer.minerscore >= ammountneeded)
{
 	oPlayer.minerscore -= ammountneeded;
	while(oPlayer.hp != oPlayer.max_hp)
	{
		oPlayer.hp ++;
	}
	ammountneeded += 5;
}