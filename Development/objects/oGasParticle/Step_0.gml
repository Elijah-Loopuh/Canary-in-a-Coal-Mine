id.depth = 0;
lifetime -= 1;
image_alpha = lifetime / lifetimeStart;
vectPos[1] -= vertSpeed;
vectPos[0] += horSpeed;
image_angle += rotationSpeed;

if (lifetime == 0)
{
	instance_destroy();
}

x = vectPos[0];
y = vectPos[1];