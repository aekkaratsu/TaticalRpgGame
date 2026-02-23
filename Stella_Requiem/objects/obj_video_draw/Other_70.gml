// When event end
var _type = async_load[? "type"];

// Show message
if (_type == "video_end")
{
    video_close();
    instance_destroy();
}