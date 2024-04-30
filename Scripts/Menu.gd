extends Control

#@onready var transition = $Transition
var music_bus= AudioServer.get_bus_index("Music")
func _ready():
	GlobalVariables.load()
	
func _on_play_pressed():
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/level_select_screen.tscn")
	#transition.play("fade_out")

func _on_settings_pressed():
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/settings_menu.tscn")

func _on_quit_pressed():
	$Select.play()
	get_tree().quit() 

func _on_upgrades_pressed():
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/Garage.tscn")


func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/level_select_screen.tscn")

func _on_music_pressed():
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
