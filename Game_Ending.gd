extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (GlobalVariables.current_level + 1 > GlobalVariables.levels_unlocked):
		GlobalVariables.levels_unlocked = GlobalVariables.current_level + 1
		GlobalVariables.save()
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/the_end.tscn")
