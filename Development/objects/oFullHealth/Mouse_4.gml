if(oPlayer.minerscore >= ammountneeded)
{
 	oPlayer.minerscore -= ammountneeded;
	oPlayer.max_hp += 1;
	while(oPlayer.hp != oPlayer.max_hp)
	{
		oPlayer.hp ++;
	}
	ammountneeded += 5;
}