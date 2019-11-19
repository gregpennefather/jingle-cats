extends Label

var score setget set_score

func set_score(value):
	score = value
	text = "Score: %s" % score