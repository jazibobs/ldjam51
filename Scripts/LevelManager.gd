extends Node2D

enum State {
	LVL_BEFORE,
	LVL_ACTIVE,
	LVL_COMPLETE,
	LVL_FAIL
}

var current_state

var player_ui_node
var start_level_button
var reset_level_button
var timer_node

var ticking_nodes
var level_animations


func _ready():
	current_state = State.LVL_BEFORE
	ticking_nodes = get_tree().get_nodes_in_group("ticking")
	level_animations = get_tree().get_nodes_in_group("level_anim")
	
	player_ui_node = $PlayerUI
	player_ui_node.connect("level_start", self, "handle_level_start")
	player_ui_node.connect("level_reset", self, "handle_level_reset")
	
	start_level_button = $PlayerUI/Overlay/CenterContainer/VBoxContainer/StartButton
	reset_level_button = $PlayerUI/Overlay/CenterContainer/VBoxContainer/ResetButton
	
	timer_node = $Bomb/Timer
	timer_node.connect("level_fail", self, "handle_level_fail")


func _process(_delta):
	if current_state == State.LVL_BEFORE:
		pass
	elif current_state == State.LVL_ACTIVE:
		player_ui_node.hide()


func handle_level_start():
	current_state = State.LVL_ACTIVE
	$TenSeconds.start(1)
	for anim in level_animations:
		anim.play()
	start_level_button.hide()
	reset_level_button.show()


func handle_level_reset():
	current_state = State.LVL_ACTIVE
	$TenSeconds.start(1)
	for anim in level_animations:
		anim.play()


func handle_level_fail():
	current_state = State.LVL_FAIL
	player_ui_node.show()
	$TenSeconds.stop()


func _on_TenSeconds_timeout():
	for node in ticking_nodes:
		node.tick()
