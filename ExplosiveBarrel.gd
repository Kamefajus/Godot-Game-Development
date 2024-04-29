extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("break")
		$CollisionPolygon2D.set_deferred("disabled",true)


func _on_animation_player_animation_finished(_anim_name):
	queue_free()
