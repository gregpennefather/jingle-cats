extends Control

func _on_Button_pressed():
	get_tree().change_scene($Button.scene_to_transition_to)
