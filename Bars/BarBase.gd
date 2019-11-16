extends Line2D

export (Color) var note_colour

onready var spawner = get_node("SpawnPoint")
onready var note_target = get_node("NoteTarget")
onready var audioPlayer = get_node("SpawnPoint/AudioStreamPlayer")

func _ready():
	note_target.colour = note_colour
	spawner.note_colour = note_colour
	get_node("SpawnPoint").spawn()
	
func _input(event):
	if (event.is_action_pressed("ui_left")):
		audioPlayer.play(0)