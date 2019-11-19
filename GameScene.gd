extends Node2D

var score = 0

func _on_NoteBars_note_hit():
	score = score + 1
	$UI/VBoxContainer/Score.score = score
	$UI/VBoxContainer/Combo.increase()


func _on_NoteBars_note_failed():
	$UI/VBoxContainer/Combo.Reset()
