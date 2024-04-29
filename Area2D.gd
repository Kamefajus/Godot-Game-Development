extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("explosive")
		$CollisionPolygon2D.set_deferred("disabled", true)


func _on_animation_player_animation_finished(anim_name):
	queue_free()

