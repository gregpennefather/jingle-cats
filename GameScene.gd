extends Node2D

onready var comboLabel = $UI/VBoxContainer/Combo
onready var videoAnimation = $VideoPlayer/AnimationPlayer
onready var noteBars = $UI/Panel/NoteBars

var score = 0

func _ready():
	var timer = Timer.new()
	timer.name = 'SimonAndDuncanTimer'
	timer.wait_time = 48
	timer.one_shot = true
	timer.connect('timeout', self, 'simonAndDuncan')
	add_child(timer)
	timer.start()

func _on_NoteBars_note_hit(noteIndex):
	score = score + 1
	print(noteIndex)
	$UI/VBoxContainer/Score.score = score
	comboLabel.increase()
	if (comboLabel.combo % 15 == 0 && comboLabel.combo != 0):
		$GameSceneAudioStreamPlayer.play_Doing_Great()
	if (noteIndex == 17 or noteIndex == 28):
		videoAnimation.play('evil_ben')
	if (noteIndex == 11.5 or noteIndex == 25):
		videoAnimation.play('mouth_ben')
	if (noteIndex == 9 or noteIndex == 1 or noteIndex == 29):
		videoAnimation.play('bounce_shark')

func _on_NoteBars_note_failed():
	if (comboLabel.combo >= 5):
		$GameSceneAudioStreamPlayer.play_Beans()
	$UI/VBoxContainer/Combo.Reset()

func _on_GameLengthTimer_timeout():
	videoAnimation.play("fade_out")
	var total_notes = noteBars.total_notes
	var best_combo = $UI/VBoxContainer/Combo.best_combo
	$UI/ResultPanel.showResults(score, total_notes, best_combo)

func _on_BlaghButton_pressed():
	$GameSceneAudioStreamPlayer.play_Blagh()
	
func evil_ben():
	videoAnimation.play('evil_ben')
	
func simonAndDuncan():
	$VideoPlayer.volume_db = -80
	$VideoPlayer/SimonAndDuncanPlayer.show()
	$VideoPlayer/SimonAndDuncanPlayer.play()
