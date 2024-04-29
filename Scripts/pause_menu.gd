extends Control
var master_bus= AudioServer.get_bus_index("Master")

func _process(delta):
	if Input.is_action_just_pressed("pause") && !$"../GameOverMenu".enabled && !$"../LevelCompletedMenu".enabled:
		if get_tree().paused:
			hide()
			get_tree().paused = false
		else:
			position = $"../Player/Camera2D2".get_screen_center_position();
			show()
			get_tree().paused = true
			
func _on_resume_pressed():
	hide()
	get_tree().paused = false

func _on_restart_pressed():
	GlobalVariables.coins += $"../Player".coins
	GlobalVariables.save()
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	GlobalVariables.coins += $"../Player".coins
	GlobalVariables.save()
	get_tree().quit()

func _on_sound_pressed():
	AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))

func _on_back_to_main_menu_pressed():
	GlobalVariables.coins += $"../Player".coins
	GlobalVariables.save()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	

