extends AnimatedSprite

func _ready():
	frame = 10


func _on_Timer_timeout():
	if frame > 0:
		frame = frame - 1
