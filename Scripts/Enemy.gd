extends RigidBody2D

var dmg = 25
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.rotation = 0-self.global_transform.get_rotation()
	$ProgressBar.value = health
	if (health < 100):
		$ProgressBar.visible = true
	if (health <= 0): get_node(".").queue_free()
	pass
	
func _on_body_entered(body):
	if (body.name == "Player"):
		get_tree().get_nodes_in_group("Player")[0].health -= dmg;
		get_node(".").queue_free()
	pass # Replace with function body.

func on_hit():
	health -= 25
