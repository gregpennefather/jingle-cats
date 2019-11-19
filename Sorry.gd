extends Control

var scene_path_to_load

func _ready():
	# $VBoxContainer/Buttons/Easy.grab_focus()
	$FadedTransition.connect('fade_in_finished', self, '_on_FadedTransition_fade_in_finished')
	$FadedTransition.connect('fade_out_finished', self, '_on_FadedTransition_fade_out_finished')
	$FadedTransition.show()
	$FadedTransition.fade_in()
	$VBoxContainer/TryHard.connect("pressed", self, "_on_Button_pressed", [$VBoxContainer/TryHard.scene_to_transition_to])


func _on_Button_pressed(scene_to_transition_to):
	$FadedTransition.show()
	$FadedTransition.fade_out()
	scene_path_to_load = scene_to_transition_to

func _on_FadedTransition_fade_out_finished():
	$FadedTransition.hide()
	get_tree().change_scene(scene_path_to_load)
	
func _on_FadedTransition_fade_in_finished():
	$FadedTransition.hide()
