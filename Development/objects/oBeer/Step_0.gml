if (place_meeting(x, y, oWall))
{
    instance_destroy();
}
if (place_meeting(x, y, oPlayer))
{
    instance_destroy();
}
image_angle += 5;
