extends Node2D

func first_valid_note():
	var children = get_children()
	var first_child = null
	for child in children:
		if (child.can_be_played()):
			if (first_child == null):
				first_child = child
			if (child.position.x < first_child.position.x):
				first_child = child
	return first_child