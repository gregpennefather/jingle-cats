tool
extends CollisionShape2D

var colour setget set_colour

func set_colour(new_colour):
	colour = new_colour
	update()
	
func _draw():
	draw_circle(Vector2(), shape.radius, colour)