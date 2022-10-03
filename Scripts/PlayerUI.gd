extends Control

export var level_title : String
export var hint : String 
signal level_start

func _ready():
	$Before/CenterContainer/VBoxContainer/LevelName.text = level_title
	$Before/CenterContainer/VBoxContainer/LevelHint.text = hint


func _on_TextureButton_pressed():
	emit_signal("level_start")
