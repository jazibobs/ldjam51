extends Node2D

var selected = false
var rest_point
var rest_node

func _ready():
	rest_node = get_child(1)
	rest_point = rest_node.global_position 
	rest_node.select()

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("Click"):
		selected = true
		
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
		if get_child(0) is AnimatedSprite:
			get_child(0).playing = true
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)
		if get_child(0) is AnimatedSprite:
			get_child(0).playing = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			rest_node.select()
			
