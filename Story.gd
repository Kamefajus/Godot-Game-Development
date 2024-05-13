extends Control

func _on_button_5_pressed():
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
