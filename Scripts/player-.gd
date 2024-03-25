extends RigidBody2D

var health = 100
var coins = 0

var wheels = []
var speed = 1000
var max_speed = 50

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")

func _process(delta):
	if health <= 0:
		self.sleeping = true;
	if Input.is_action_pressed("ui_right"):
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(speed * delta * 60)
	
	if Input.is_action_pressed("ui_left"):
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(-speed * delta * 60)
