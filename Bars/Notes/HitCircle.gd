tool
extends CollisionShape2D

export (Color) var colour setget set_colour

onready var tween = get_node("Tween")

func _ready():
	visible = false

func set_colour(new_colour):
	colour = new_colour
	update()
	
func _draw():
	draw_circle_outline(Vector2(), shape.radius, 5, colour)
	
func expand(initial_radius, final_radius, time):
	visible = true
	tween.interpolate_method(self, 'change_radius', initial_radius, final_radius, time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	#tween.interpolate_method(self, 'change_radius', final_radius, initial_radius, time, Tween.TRANS_LINEAR, Tween.EASE_OUT, time)
	tween.connect('tween_completed', self, 'expand_completed')
	tween.start()
	
func expand_completed(obj, path):
	visible = false
	shape.radius = 0
	
func change_radius(new_radius):
	shape.radius = new_radius
	update()
	
func draw_circle_outline(center, radius, width, color):
	var nb_points = 128
	var points_arc = PoolVector2Array()
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(i * 360 / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	
	
	for i in range(points_arc.size()):
		if (i + 1 < points_arc.size()):
			draw_line(points_arc[i], points_arc[i+1], colour,width, false)