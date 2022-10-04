extends AnimatedSprite

var counter = 10

signal level_fail

func tick():
	print(counter)
		
	if counter == 0:
		emit_signal("level_fail")
		counter = 10
	else:
		counter -= 1
		$".".frame = counter 
