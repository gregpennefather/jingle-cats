extends Position2D

export (PackedScene) var note_scene
var note_colour

func spawn():
	var note = note_scene.instance()
	note.colour = note_colour
	note.position = position
	get_parent().add_child(note)