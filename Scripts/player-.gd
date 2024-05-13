extends RigidBody2D

var health = 100
var coins = 0

var wheels = []
var speed = 1000 + GlobalVariables.engine * 10
var max_speed = 50

var fuel_capacity = 20
var fuel_level = fuel_capacity 
var fuel_decrease_rate = (0.0001 - GlobalVariables.fuel / 100.0 * 0.0001)
var current_velocity = 0

var can_boost = true
var boost_duration = 2
var boost_timer = 0

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")

func _process(delta):
	if health <= 0 || fuel_level <= 0:
		GlobalVariables.coins += coins
		$"../GameOverMenu".enable()
		$gg.play()
		
	current_velocity = wheels.pick_random().angular_velocity
	
	if GlobalVariables.booster != 0:
		$Sprite2D.visible=true
	
	if can_boost && GlobalVariables.booster != 0:
		$"../GUI/boost".value = 100
	else:
		$"../GUI/boost".value = (boost_timer/boost_duration)*100
	
	if boost_timer > 0:
		boost_timer -= delta
		for wheel in wheels:
			wheel.apply_torque_impulse(speed * 2 * delta * 60) # Adjust the multiplier for thrust as needed
	#else:
		#can_boost = true
	
	if Input.is_action_pressed("boost") && GlobalVariables.booster != 0 && can_boost:
		boost_timer = boost_duration
		can_boost = false
		
	if Input.is_action_pressed("move_right"):
		if !Input.is_action_pressed("move_left"):
			fuel_level -= abs(current_velocity) * fuel_decrease_rate
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(speed * delta * 60)
	
	if Input.is_action_pressed("move_left"):
		if !Input.is_action_pressed("move_right"):
			fuel_level -= abs(current_velocity) * fuel_decrease_rate
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(-speed * delta * 60)

func _on_body_entered(body):
	if "Enemy" in body.name:
		body.queue_free()
		$Ouch.play()
	if "Barrel" in body.name:
		body.queue_free()
		$barsound.play()
