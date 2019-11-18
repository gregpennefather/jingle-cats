extends Line2D

export (Color) var note_colour
export (String) var action

var missed_colour = Color(255, 0, 0)

onready var spawner = get_node("SpawnPoint")
onready var note_target = get_node("NoteTarget")
onready var notes = get_node("Notes")
onready var animation_player = get_node("AnimationPlayer")

func _ready():
	note_target.colour = note_colour
	spawner.note_colour = note_colour
	get_node("Outline").default_color = note_colour
	get_node("SpawnPoint").spawn(7)
	
	var timer = Timer.new()
	timer.wait_time = 2
	timer.connect("timeout", self, "add_A_Long")
	timer.start()
	timer.one_shot = true
	add_child(timer)
	
func _input(event):
	if (event.is_action_pressed(action)):
		var next_note = notes.first_valid_note()
		if (next_note != null):
			next_note.play()
			
func add_A_Long():
	spawner.spawn(0)
	
func on_note_hit():
	animation_player.play('hit')

func on_note_missed():
	animation_player.play('missed')
	
func on_note_hit_early():
	animation_player.play('missed')