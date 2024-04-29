extends Control

func _ready():
	if (GlobalVariables.levels_unlocked >= 2):
		$MarginContainer/VBoxContainer/Button2/TextureRect.hide()
	if (GlobalVariables.levels_unlocked >= 3):
		$MarginContainer/VBoxContainer/Button3/TextureRect.hide()
	if (GlobalVariables.levels_unlocked >= 4):
		$MarginContainer/VBoxContainer/Button4/TextureRect.hide()
		
func _on_button_pressed():
	GlobalVariables.current_level = 1
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

func _on_button_2_pressed():
	if (GlobalVariables.levels_unlocked >= 2):
		GlobalVariables.current_level = 2
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")

func _on_button_3_pressed():
	if (GlobalVariables.levels_unlocked >= 3):
		GlobalVariables.current_level = 3
		get_tree().change_scene_to_file("res://Scenes/level_3.tscn")

func _on_button_4_pressed():
	if (GlobalVariables.levels_unlocked >= 4):
		GlobalVariables.current_level = 4
		get_tree().change_scene_to_file("res://Scenes/level_4.tscn")

func _on_button_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
