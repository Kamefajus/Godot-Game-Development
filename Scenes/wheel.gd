extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.weight > 0:
		$Wheel.visible = false
		$Wheel2.visible = true
	pass
