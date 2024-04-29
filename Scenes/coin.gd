extends Area2D

var value = 10

func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().get_current_scene().add_coins(value)
		$AnimationPlayer.play("pickup")
		$CollisionShape2D.set_deferred("disabled",true)
		get_tree().get_nodes_in_group("Player")[0].coins += value;

func _on_animation_player_animation_finished(anim_name):
	queue_free()
