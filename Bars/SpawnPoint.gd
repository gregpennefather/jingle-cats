extends Position2D

export (PackedScene) var note_scene
export (AudioStream) var A_Long
export (AudioStream) var A_Short
export (AudioStream) var B_Long
export (AudioStream) var B_Short
export (AudioStream) var C_Short
export (AudioStream) var CBottom_Long
export (AudioStream) var CTop_Long
export (AudioStream) var G_Long
var note_colour

func spawn(note_index):
	var note = note_scene.instance()
	note.colour = note_colour
	if (note_index == 0):
		note.note_audio = A_Long
	if (note_index == 1):
		note.note_audio = A_Short
	if (note_index == 7):
		note.note_audio = G_Long
	note.position = position
	note.connect('note_hit', get_parent(), 'on_note_hit')
	note.connect('note_missed', get_parent(), 'on_note_missed')
	note.connect('note_hit_early', get_parent(), 'on_note_hit_early')
	get_parent().get_node("Notes").add_child(note)