extends Camera2D
var edge_margin = 5
var cam_speed = 200
var map_size = Vector2(1024, 1024)
var viewport_size = Vector2(256, 256)
var un_zoomed_viewport_size = Vector2(1024,256)
var zoom_x = 2
var zoom_y = 2

func _input(event):
	if event.is_action("MouseWheelDown"):
		if zoom_x > 1:
			var pre_zoom_value = zoom
			zoom_x -= 0.25
			zoom_y -= 0.25
			zoom =Vector2(zoom_x, zoom_y)
			position += (Vector2(1,1) - pre_zoom_value / zoom)
	elif event.is_action("MouseWheelUp"):
		if zoom_x < 4:
			#var mouse_position = get_viewport().get_mouse_position()
			var pre_zoom_value = zoom
			zoom_x += 0.25
			zoom_y += 0.25
			zoom = Vector2(zoom_x, zoom_y)
			position += (Vector2(1,1) - pre_zoom_value / zoom)
