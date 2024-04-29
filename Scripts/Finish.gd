extends Area2D

func _on_body_entered(body):
	if (GlobalVariables.current_level + 1 > GlobalVariables.levels_unlocked):
		GlobalVariables.levels_unlocked = GlobalVariables.current_level + 1
		GlobalVariables.save()
	if body.is_in_group("Player"):
		$"../LevelCompletedMenu".enable()
