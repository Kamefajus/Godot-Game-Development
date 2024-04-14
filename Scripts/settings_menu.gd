class_name OptionsMenu
extends Control

@onready var Back = $MarginContainer/VBoxContainer/Back as Button


signal exit_options_menu

func _ready():
	Back.button_down.connect(on_exit_pressed)
	set_process(false)
	
	
func on_exit_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
	
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
