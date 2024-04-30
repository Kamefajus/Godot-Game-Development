extends Control

@export_file var level_path

var original_size := scale
var grow_size := Vector2(1.1, 1.1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_mouse_entered():
	grow_btn(grow_size, .1)


func _on_button_mouse_exited():
	grow_btn(original_size, .1)

func grow_btn(end_size: Vector2, duration: float) -> void:
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'scale',end_size, duration)



func _on_button_pressed() -> void:
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	


func _on_button_2_pressed():
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")


func _on_button_3_pressed():
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")


func _on_button_4_pressed():
	$Select.play()
	get_tree().change_scene_to_file("res://Scenes/level_4.tscn")
