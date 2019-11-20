extends Panel

var scene_path_to_load

func _ready():
	var button = $VBoxContainer/Restart
	print(button.scene_to_transition_to)
	button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_transition_to])

func showResults(score, max_notes, combo):
	var succeeded = score > 36
	var scoreString = "Score: %s / %s" %[str(score), str(max_notes)]
	if (succeeded):
		$VBoxContainer/ResultText.text = "Well done!"
	else:
		$VBoxContainer/ResultText.text = "Oof not great"
	$VBoxContainer/ScoreText.text = scoreString
	$VBoxContainer/ComboText.text = "Best Combo: %s" %str(combo)
	show()

func _on_Button_pressed(scene_to_transition_to):
	get_tree().change_scene(scene_to_transition_to)