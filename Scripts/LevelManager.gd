extends Node2D

enum State {
	LVL_BEFORE,
	LVL_ACTIVE,
	LVL_COMPLETE,
	LVL_FAIL
}

var current_state
var player_ui_node


func _ready():
	current_state = State.LVL_BEFORE
	player_ui_node = $PlayerUI
	player_ui_node.connect("level_start", self, "handle_level_start")
	
	
func _process(_delta):
	if current_state == State.LVL_BEFORE:
		pass
	elif current_state == State.LVL_ACTIVE:
		player_ui_node.hide()


func handle_level_start():
	current_state = State.LVL_ACTIVE
