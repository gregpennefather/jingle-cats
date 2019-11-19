extends Label

var combo = 0

func increase():
	combo += 1
	text = "Combo: %s" % combo
	
	
func Reset():
	combo = 0
	text = "Combo: %s" % combo