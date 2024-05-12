extends Node2D

const bulletPath = preload("res://Scenes/bullet.tscn")

const delay = 30
const remove = 1 # how many delay ms to remove, for each upgrade
var curr_delay = 0
var nearest

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	var lvl_name = get_parent().name
	if GlobalVariables.gun > 0 && lvl_name != 'Player':
		$fakegun.visible = true
		$Sprite2D.visible = false
	elif GlobalVariables.gun > 0 and lvl_name == 'Player':
		$Sprite2D.visible = true
		$fakegun.visible = false
		var enemies = get_tree().get_nodes_in_group("Enemy")
		nearest = enemies[0]
		for enemy in enemies:
			if enemy.global_position.distance_to(self.global_position) < nearest.global_position.distance_to(self.global_position):
				nearest = enemy
				
		$RayCast2D.target_position = nearest.position
		$Line2D.points = PackedVector2Array([$RayCast2D.position, $RayCast2D.target_position])
		if $RayCast2D.is_colliding():
			if $RayCast2D.get_collider():
				if $RayCast2D.get_collider().get_name() == "Player" || $RayCast2D.get_collider().get_name() == "Detection_Area":
					$RayCast2D.add_exception($RayCast2D.get_collider())
				if $RayCast2D.get_collider().get_name().contains("Enemy"):
					self.look_at(nearest.position)
					$Line2D.visible = true
				else:
					$Line2D.visible = false
					self.rotation = 0
		else:
			$Line2D.visible = false
			self.rotation = 0
		
		if curr_delay > 0: 
			curr_delay-=1
			
		if Input.is_action_pressed("shoot"):
			if curr_delay == 0:
				curr_delay = delay-remove*GlobalVariables.gun
				shoot() # 85x 0y
	pass

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = $Marker2D.global_position
	bullet.velocity = nearest.global_position - bullet.global_position
	
	# play sound
	var r = randi_range(1,5) #RandomNumberGenerator.new().randf_range(1, 5)
	match r:
		1:
			$Shoot1.play()
		2:
			$Shoot2.play()
		3:
			$Shoot3.play()
		4:
			$Shoot4.play()
		5:
			$Shoot5.play()
	pass
