extends Sprite2D

@export var deathParticle : PackedScene
var dmg = 10
var health = 100


#func _ready():
	#await(get_tree().create_timer(1),"timeout")
	#Kill()
	
func Kill():
	var _particle = deathParticle.instance()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	get_tree().current_scene.add_child(_particle)
	queue_free()

func _on_body_entered(body):
	if (body.name == "Player"):
		get_tree().get_nodes_in_group("Player")[0].health -= dmg;
		Kill()
		get_node(".").queue_free()
	pass # Replace with function body.

func on_hit():
	health -= 25
