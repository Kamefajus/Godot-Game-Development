extends Control

@onready var transition = $Transition

func _on_play_pressed():
	transition.play("fade_out")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")

func _on_quit_pressed():
	get_tree().quit() 

func _on_upgrades_pressed():
	get_tree().change_scene_to_file("res://Scenes/Garage.tscn")


func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/level_select_screen.tscn")
