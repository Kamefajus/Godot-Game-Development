extends Control

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")

func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_4.tscn")

func _on_button_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
