extends RigidBody2D

var dmg = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (body.name == "Player"):
		get_tree().get_nodes_in_group("Player")[0].health -= dmg;
		get_node(".").queue_free()
	pass # Replace with function body.
