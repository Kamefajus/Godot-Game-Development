extends RichTextLabel

var time_start = 0
var time_now = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	time_start = Time.get_unix_time_from_system()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_now = Time.get_unix_time_from_system()
	var time_elapsed = snapped(time_now - time_start, 0.01)
	get_node(".").text = "Timer: 	" + str(time_elapsed) + "		seconds"
	pass
