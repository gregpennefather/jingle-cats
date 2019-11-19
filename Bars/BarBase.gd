extends Line2D

export (Color) var note_colour
export (String) var action

var missed_colour = Color(255, 0, 0)

signal note_hit
signal note_failed

onready var spawner = get_node("SpawnPoint")
onready var note_target = get_node("NoteTarget")
onready var notes = get_node("Notes")
onready var animation_player = get_node("AnimationPlayer")

func _ready():
	note_target.colour = note_colour
	spawner.note_colour = note_colour
	get_node("Outline").default_color = note_colour
	
func add_note(noteType):
	print('adding note: ' + str(noteType))
	get_node("SpawnPoint").spawn(noteType)
	
func add_note_array(note_play_info_array):
	for play_info in note_play_info_array:
		print(str(play_info.PlayTime) + ' ' + str(play_info.NoteType))
		var timer = Timer.new()
		timer.name = 'Time' + str(play_info.PlayTime) + 'Note' + str(play_info.NoteType)
		timer.wait_time = play_info.PlayTime - 4
		timer.one_shot = true
		timer.connect('timeout', self, 'add_note', [play_info.NoteType])
		add_child(timer)
		timer.start()
	
func _input(event):
	if (event.is_action_pressed(action)):
		var next_note = notes.first_valid_note()
		if (next_note != null):
			next_note.play()
	
func on_note_hit():
	animation_player.play('hit')
	emit_signal('note_hit')

func on_note_missed():
	animation_player.play('missed')
	emit_signal("note_failed")
	
func on_note_hit_early():
	animation_player.play('missed')
	emit_signal("note_failed")