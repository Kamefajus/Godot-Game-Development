extends Control

func _process(delta):
	if Input.is_action_just_pressed("pause"):
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
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
