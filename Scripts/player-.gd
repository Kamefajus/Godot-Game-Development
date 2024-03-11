extends RigidBody2D

var wheels = []
var speed = 2000

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		for wheel in wheels:
			wheel.apply_torque_impulse(speed * delta * 60)
