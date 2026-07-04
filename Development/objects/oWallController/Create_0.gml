//function spawn_wall_row(start_x, start_y, length)
// Makes room borders automatically
width = room_width /32 + 2; 
height = room_height /32 + 2;
spawn_room_walls(-32 , -32, width, height);
function spawn_room_walls(x, y, width, height, )
{
    var w = width;
    var h = height;

    for (var yy = 0; yy < h; yy++)
    {
        for (var xx = 0; xx < w; xx++)
        {
            // 2-tile thick border condition
            if (xx < 2 || xx >= w - 2 || yy < 2 || yy >= h - 2)
            {
                instance_create_layer(
                    x + xx * 32,
                    y + yy * 32,
                    "Instances",
                    oWall
                );
            }
        }
    }
}
function spawn_wall_row(start_x, start_y, length)
{
    for (var i = 0; i < length; i++)
    {
        instance_create_layer(
            start_x + i * 32,
            start_y,
            "Instances",
            oWall
        );
    }
}
function spawn_wall_collum(start_x, start_y, length)
{
    for (var i = 0; i < length; i++)
    {
        instance_create_layer(
            start_x,
            start_y + i * 32,
            "Instances",
            oWall
        );
    }
}