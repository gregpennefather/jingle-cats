extends Node2D

onready var comboLabel = $UI/VBoxContainer/Combo

var score = 0

func _on_NoteBars_note_hit():
	score = score + 1
	$UI/VBoxContainer/Score.score = score
	comboLabel.increase()
	if (comboLabel.combo % 15 == 0 && comboLabel.combo != 0):
		$GameSceneAudioStreamPlayer.play_Doing_Great()

func _on_NoteBars_note_failed():
	if (comboLabel.combo >= 5):
		$GameSceneAudioStreamPlayer.play_Beans()
	$UI/VBoxContainer/Combo.Reset()

func _on_GameLengthTimer_timeout():
	$VideoPlayer/AnimationPlayer.play("fade_out")
	var total_notes = $UI/Panel/NoteBars.total_notes
	var best_combo = $UI/VBoxContainer/Combo.best_combo
	$UI/ResultPanel.showResults(score, total_notes, best_combo)

func _on_BlaghButton_pressed():
	$GameSceneAudioStreamPlayer.play_Blagh()
