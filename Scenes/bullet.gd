extends RigidBody2D

var velocity = Vector2(1, 0)
var speed = 3000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
	if collision_info:
		var collider = collision_info.get_collider()
		if collider.is_in_group("Enemy"): 
			collider.on_hit()
			print("enemy")
		get_node(".").queue_free()
	pass
