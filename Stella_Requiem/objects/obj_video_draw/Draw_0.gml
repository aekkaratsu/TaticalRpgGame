// Get duration to freeze
var _pos = video_get_position();
var _dur = video_get_duration()

if (_dur > 0 && _pos >= _dur - 100) // Pase when 100 ms
{
    video_pause();
}

// Pull video
var _video_data = video_draw();
var _status = _video_data[0]; // 0 = is playing


if (_status == 0 || _status == 1)
{
    var _video_surface = _video_data[1];
    
    if (surface_exists(_video_surface))
    {
        draw_surface(_video_surface, 0, 0);
        
        // Max size
        draw_surface_stretched(_video_surface, 0, 0, room_width, room_height);
    }
}
