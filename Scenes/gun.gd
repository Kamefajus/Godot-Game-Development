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
	print(lvl_name)
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
		
		self.look_at(nearest.global_position)
		
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
	pass
