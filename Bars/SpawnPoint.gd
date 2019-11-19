extends Position2D

export (PackedScene) var note_scene
export (AudioStream) var A_Long
export (AudioStream) var A_Short
export (AudioStream) var B_Long
export (AudioStream) var B_Short
export (AudioStream) var C_Short
export (AudioStream) var CBottom_Long
export (AudioStream) var CTop_Long
export (AudioStream) var DBottom_Long
export (AudioStream) var DTop_Long
export (AudioStream) var E_Long
export (AudioStream) var ETop_Long
export (AudioStream) var F_Short
export (AudioStream) var FTop_long
export (AudioStream) var G_Long
var note_colour

func spawn(noteType):
	var note = note_scene.instance()
	note.colour = note_colour
	match noteType:
		[Note.NoteType.ALong]:
			note.note_audio = A_Long
		[Note.NoteType.A_Short]:
			note.note_audio = A_Short
		[Note.NoteType.B_Long]:
			note.note_audio = B_Long
		[Note.NoteType.B_Short]:
			note.note_audio = B_Short
		[Note.NoteType.C_Short]:
			note.note_audio = C_Short
		[Note.NoteType.CBottom_Long]:
			note.note_audio = CBottom_Long
		[Note.NoteType.CTop_Long]:
			note.note_audio = CTop_Long
		[Note.NoteType.DBottom_Long]:
			note.note_audio = DBottom_Long
		[Note.NoteType.DTop_Long]:
			note.note_audio = DBottom_Long
		[Note.NoteType.E_Long]:
			note.note_audio = E_Long
		[Note.NoteType.ETop_Long]:
			note.note_audio = ETop_Long
		[Note.NoteType.F_Short]:
			note.note_audio = F_Short
		[Note.NoteType.FTop_long]:
			note.note_audio = FTop_long
		[Note.NoteType.G_Long]:
			note.note_audio = G_Long
		
	note.position = position
	note.connect('note_hit', get_parent(), 'on_note_hit')
	note.connect('note_missed', get_parent(), 'on_note_missed')
	note.connect('note_hit_early', get_parent(), 'on_note_hit_early')
	get_parent().get_node("Notes").add_child(note)