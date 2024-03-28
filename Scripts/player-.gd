extends RigidBody2D

var health = 100
var coins = 0

var wheels = []
var speed = 1000
var max_speed = 50

var fuel_capacity = 20
var fuel_level = fuel_capacity
var current_velocity = 0

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")

func _process(delta):
	if health <= 0 || fuel_level <= 0:
		$"../GameOverMenu".enable()
		
	current_velocity = wheels.pick_random().angular_velocity
		
	if Input.is_action_pressed("move_right"):
		if !Input.is_action_pressed("move_left"):
			fuel_level -= abs(current_velocity) * 0.0001
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(speed * delta * 60)
	
	if Input.is_action_pressed("move_left"):
		if !Input.is_action_pressed("move_right"):
			fuel_level -= abs(current_velocity) * 0.0001
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(-speed * delta * 60)
	

