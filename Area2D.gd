extends Area2D


func _on_body_entered(body):


func _on_animation_player_animation_finished(anim_name):
	queue_free()

