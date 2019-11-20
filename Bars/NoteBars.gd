extends Control

onready var RedBar = get_node("RedBar")
onready var GreenBar = get_node("GreenBar")
onready var OrangeBar = get_node("OrangeBar")

signal note_hit
signal note_failed

const FIRST_NOTE_OFFSET = 10.5
const NOTE_LENGTH = 0.565
const RED_BAR_NOTES = [Note.NoteType.G_Long, Note.NoteType.DTop_Long,  Note.NoteType.CBottom_Long, Note.NoteType.DBottom_Long]
const GREEN_BAR_NOTES = [Note.NoteType.A_Short, Note.NoteType.FTop_long, Note.NoteType.F_Short, Note.NoteType.CTop_Long]
const ORANGE_BAR_NOTES = [Note.NoteType.E_Long, Note.NoteType.B_Short, Note.NoteType.A_Long,  Note.NoteType.B_Long,  Note.NoteType.ETop_Long]

# Called when the node enters the scene tree for the first time.
func _ready():	
	var notes = get_notes('notes.json')

	var red_notes = []
	var green_notes = []
	var orange_notes = []
	
	for note_info in notes:
		if (note_info.NoteType in RED_BAR_NOTES):
			red_notes.append(note_info)
		elif (note_info.NoteType in GREEN_BAR_NOTES):
			green_notes.append(note_info)
		elif (note_info.NoteType in ORANGE_BAR_NOTES):
			orange_notes.append(note_info)
		else:
			print('could not find a noteBar for note with type: ' + str(note_info.NoteType))

	RedBar.add_note_array(red_notes)
	GreenBar.add_note_array(green_notes)
	OrangeBar.add_note_array(orange_notes)


func createNotePlayInfo(playTime, noteType):
	var play_info = PlayTimeInfo.new()
	play_info.PlayTime = playTime
	play_info.NoteType = noteType
	return play_info

func get_notes(filename):
	var file = File.new()
	file.open("res://%s" % filename, file.READ)
	var json = parse_json(file.get_as_text())
	return load_note_info(json)

func load_note_info(note_info_array: Array) -> Array:
	var notes = []
	for note_info in note_info_array:
		notes.append(createNotePlayInfo(note_index_to_playtime(note_info.index), noteStringToEnum(note_info.note)))
	return notes
	
func note_index_to_playtime(index):
	return FIRST_NOTE_OFFSET + (NOTE_LENGTH * (index-1))
	
func noteStringToEnum(noteTypeString):
	if (noteTypeString == 'A_Long'):
		return Note.NoteType.A_Long
	if (noteTypeString == 'A_Short'):
		return Note.NoteType.A_Short
	if (noteTypeString == 'B_Long'):
		return Note.NoteType.B_Long
	if (noteTypeString == 'B_Short'):
		return Note.NoteType.B_Short
	if (noteTypeString == 'CBottom_Long'):
		return Note.NoteType.CBottom_Long
	if (noteTypeString == 'CTop_Long'):
		return Note.NoteType.CTop_Long
	if (noteTypeString == 'DBottom_Long'):
		return Note.NoteType.DBottom_Long
	if (noteTypeString == 'DTop_Long'):
		return Note.NoteType.DTop_Long
	if (noteTypeString == 'E_Long'):
		return Note.NoteType.E_Long
	if (noteTypeString == 'ETop_Long'):
		return Note.NoteType.ETop_Long
	if (noteTypeString == 'F_Short'):
		return Note.NoteType.F_Short
	if (noteTypeString == 'FTop_Long'):
		return Note.NoteType.FTop_long
	if (noteTypeString == 'G_Long'):
		return Note.NoteType.G_Long
	print('could no match noteTypeString : ' + noteTypeString)
	return null

func _on_RedBar_note_hit():
	emit_signal("note_hit")


func _on_GreenBar_note_hit():
	emit_signal("note_hit")


func _on_OrangeBar_note_hit():
	emit_signal("note_hit")

func _on_note_failed():
	emit_signal("note_failed")
