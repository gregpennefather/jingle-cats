tool
extends Position2D

export (Color) var colour = Color(255, 255, 255, 255) setget set_colour
export (float) var radius

func set_colour(new_colour):
	colour = new_colour
	update()

func _ready():
	update()
	
func _draw():
	draw_circle(Vector2(), radius + 3, colour)
	draw_circle(Vector2(), radius, Color(0, 0, 0, 255))