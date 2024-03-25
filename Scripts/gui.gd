extends RichTextLabel

var x_initial = 0
var time_start = 0
var time_now = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	x_initial = $"../../Player/Camera2D2".get_screen_center_position().x;
	time_start = Time.get_unix_time_from_system()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x_current = $"../../Player/Camera2D2".get_screen_center_position().x;
	var x_final = $"../../Finish".position.x;
	var progress = (x_current - x_initial) / (x_final - x_initial) * 100;
	text = "[Progress: " + str(snapped(progress, 0)) + "%] ";
	
	var time_now = Time.get_unix_time_from_system()
	var time_elapsed = time_now - time_start
	text += "[Time elapsed: " + str(snapped(time_elapsed, 0)) + " seconds] "

