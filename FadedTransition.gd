extends ColorRect

signal fade_in_finished
signal fade_out_finished

func _ready():
	$AnimationPlayer.connect('animation_finished', self, '_on_AnimationPlayer_animation_finished')

func fade_out():
	$AnimationPlayer.play("fade_out")
	
func fade_in():
	$AnimationPlayer.play("fade_in")

func _on_AnimationPlayer_animation_finished(animation_name):
	if(animation_name == 'fade_out'):
		emit_signal("fade_out_finished")
	elif(animation_name == 'fade_in'):
		emit_signal("fade_in_finished")
