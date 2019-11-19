extends Node2D


onready var RedBar = get_node("RedBar")
onready var GreenBar = get_node("GreenBar")
onready var OrangeBar = get_node("OrangeBar")

# Called when the node enters the scene tree for the first time.
func _ready():	
	RedBar.add_note_array([createNotePlayInfo(10, Note.NoteType.G_Long)])
	GreenBar.add_note_array([createNotePlayInfo(10.5, Note.NoteType.A_Short)])

func createNotePlayInfo(playTime, noteType):
	var play_info = PlayTimeInfo.new()
	play_info.PlayTime = playTime
	play_info.NoteType = noteType
	return play_info