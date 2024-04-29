extends RigidBody2D

@export var speed = 100
var player_chase = false
var player = null
var dmg = 10
var health = 100

func _physics_process(delta):
	if player_chase:
		position += (player.position - position) / speed


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
		get_tree().get_nodes_in_group("Player")[0].health -= dmg - (dmg / 100.0 * GlobalVariables.armor)
		get_node(".").queue_free()
	pass # Replace with function body.

func on_hit():
	health -= dmg + ((100 - dmg) / 100.0 * GlobalVariables.gun)

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
