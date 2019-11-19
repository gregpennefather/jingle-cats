class_name Note
extends Position2D

enum NoteType { A_Long, A_Short, B_Long, B_Short, C_Short, CBottom_Long, CTop_Long, DBottom_Long, DTop_Long, E_Long, ETop_Long, F_Short, FTop_long, G_Long }

const NOTE_SPEED = 250
const VALID_NOTE_RADIUS = 25

var colour setget set_colour
var note_audio setget set_note_audio
var target_left_position = 280 - VALID_NOTE_RADIUS
var target_right_position = 280 + VALID_NOTE_RADIUS
var target_can_be_hit = 280 + (VALID_NOTE_RADIUS*2)
var active = true

signal note_missed
signal note_hit
signal note_hit_early

onready var hitCircle = get_node("HitCircle")

func set_colour(new_colour):
	colour = new_colour
	get_node("Area2D/CircleCollision").colour = new_colour
	get_node("HitCircle").colour = new_colour

func set_note_audio(audio_stream):
	get_node("AudioPlayer").stream = audio_stream

func _process(delta):
	position = position - Vector2(NOTE_SPEED * delta, 0)
	if (global_position.x < target_left_position && active):
		note_missed();

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func can_be_played():
	return global_position.x <= target_can_be_hit && global_position.x >= target_left_position && active

func play():
	if (active):
		if (global_position.x >= target_left_position && global_position.x <= target_right_position):
			note_hit()
		else:
			note_hit_early()
	
func note_hit():
	emit_signal('note_hit')
	hitCircle.expand(20, 40, 0.2);
	get_node("AudioPlayer").play()
	make_note_inactive(false)
	
func note_hit_early():
	emit_signal('note_hit_early')
	make_note_inactive()
	
func note_missed():
	emit_signal('note_missed')
	make_note_inactive()
	
func make_note_inactive(with_fade = true):
	if with_fade:
		self.set_colour(Color(colour.r, colour.g, colour.b, 0.5))
	active = false
