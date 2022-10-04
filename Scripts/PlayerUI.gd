extends Control

export var level_title : String
export var hint : String 
signal level_start
signal level_reset

func _ready():
	$Overlay/CenterContainer/VBoxContainer/LevelName.text = level_title
	$Overlay/CenterContainer/VBoxContainer/LevelHint.text = hint


func _on_ResetButton_pressed():
	emit_signal("level_reset")


func _on_StartButton_pressed():
	emit_signal("level_start")
