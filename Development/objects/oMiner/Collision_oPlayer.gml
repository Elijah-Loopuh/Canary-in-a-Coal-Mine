// touch player = die unless past capacity
//if (oPlayer.cancollect = true)

if (oPlayer.minersCollected < oPlayer.minercapacity)
{
	oPlayer.minersCollected += 1
	instance_deactivate_object(id)
}