extends Label

var combo = 0
var best_combo = 0

func increase():
	combo += 1
	if (combo > best_combo):
		best_combo = combo
	text = "Combo: %s" % combo
	
	
func Reset():
	combo = 0
	text = "Combo: %s" % combo