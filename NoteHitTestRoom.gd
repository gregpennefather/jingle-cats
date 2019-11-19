extends Node2D

onready var note = get_node("Note")

# Called when the node enters the scene tree for the first time.
func _ready():
	note.colour = Color(255, 255, 0, 255)
	
func _process(delta):
	note.global_position = Vector2(280,  200)

func _input(event):
	if (event.is_action_pressed("ui_left")):
		if (note != null):
			note.play()
			note.active = true