extends Control

var enabled = false

func enable():
	position = $"../Player/Camera2D2".get_screen_center_position();
	show();
	enabled = true
	get_tree().paused = true

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
