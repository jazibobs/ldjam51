extends Node2D

var selected = false
var rest_point
var rest_nodes = []

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position 
	rest_nodes[0].select()

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("Click"):
		selected = true
		
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
		get_child(0).playing = true
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)
		get_child(0).playing = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance
