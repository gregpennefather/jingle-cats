extends Node2D

onready var cat1Animation = get_node("Cat1Animation")
onready var cat1Player = get_node("Cat1Player")
onready var cat2Animation = get_node("Cat2Animation")
onready var cat2Player = get_node("Cat2Player")
onready var cat3Animation = get_node("Cat3Animation")
onready var cat3Player = get_node("Cat3Player")

func _ready():
	pass
	
func _input(event):
	if (event.is_action_pressed("ui_left")):
		cat1Animation.play("meow")
		cat1Player.play(0)
	if (event.is_action_pressed("ui_down")):
		cat2Animation.play("meow")
		cat2Player.play(0)
	if (event.is_action_pressed("ui_right")):
		cat3Animation.play("meow")
		cat3Player.play(0)

func _on_Cat1Animation_animation_finished():
	cat1Animation.play("idle")
	cat1Animation.stop()

func _on_Cat2Animation_animation_finished():
	cat2Animation.play("idle")
	cat2Animation.stop()

func _on_Cat3Animation_animation_finished():
	cat3Animation.play("idle")
	cat3Animation.stop()
