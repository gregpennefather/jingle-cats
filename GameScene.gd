extends Node2D

var score = 0

func _on_NoteBars_note_hit():
	score = score + 1
	$UI/VBoxContainer/Score.score = score
	$UI/VBoxContainer/Combo.increase()

func _on_NoteBars_note_failed():
	$UI/VBoxContainer/Combo.Reset()

func _on_GameLengthTimer_timeout():
	$VideoPlayer/AnimationPlayer.play("fade_out")
	var total_notes = $UI/Panel/NoteBars.total_notes
	var best_combo = $UI/VBoxContainer/Combo.best_combo
	$UI/ResultPanel.showResults(score, total_notes, best_combo)

func _on_BlaghButton_pressed():
	$GameSceneAudioStreamPlayer.play_Blagh()
