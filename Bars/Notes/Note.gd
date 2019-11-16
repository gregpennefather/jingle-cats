extends Position2D

var colour setget set_colour

func set_colour(new_colour):
	colour = new_colour
	get_node("Area2D/CircleCollision").colour = new_colour

func _process(delta):
	position = position - Vector2(100 * delta, 0)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
