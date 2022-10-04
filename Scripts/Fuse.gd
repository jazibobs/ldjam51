extends Node2D

var countdown = 10
var x = 0
var y = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	var fuse_part = $FullFuse/FusePart
	var new_fuse
	
	for _i in range(1, countdown):
		x += 8
		y -= 8
		new_fuse = fuse_part.duplicate()
		new_fuse.set_position(Vector2(x, y))
		$FullFuse.add_child(new_fuse)
		# print_debug(x, y)
	$Spark.set_position(Vector2(x, y))


func tick():
	print(countdown)
	countdown -= 1
	
	if countdown == 0:
		x = 80
		y = -80
		$Spark.visible = true
		$Spark.set_position(Vector2(x, y))
			
		for fuse in $FullFuse.get_children():
			fuse.frame = 0
		
		countdown = 10
	else:
		x -= 8
		y += 8
		var current_fuse = $FullFuse.get_child(countdown)
		current_fuse.frame = 1
		$Spark.set_position(Vector2(x, y))
