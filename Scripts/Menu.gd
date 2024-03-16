extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")



func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.
