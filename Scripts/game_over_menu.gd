extends Control

var enabled = false

func enable():
	position = $"../Player/Camera2D2".get_screen_center_position();
	show();
	enabled = true
	get_tree().paused = true

func _on_restart_pressed():
	GlobalVariables.coins += $"../Player".coins
	GlobalVariables.save()
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func _on_quit_pressed():
	GlobalVariables.coins += $"../Player".coins
	GlobalVariables.save()
	get_tree().quit()
	
func _on_back_to_main_menu_pressed():
	GlobalVariables.coins += $"../Player".coins
	GlobalVariables.save()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
