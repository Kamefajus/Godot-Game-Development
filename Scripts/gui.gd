extends CanvasLayer

var x_initial = 0
var time_start = 0
var time_now = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	x_initial = $"../../Player/Camera2D2".get_screen_center_position().x;
	time_start = Time.get_unix_time_from_system()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_now = Time.get_unix_time_from_system()
	var time_elapsed = snapped(time_now - time_start, 0.01)
  
	get_node("./Timer2/TimerTxt").text = str(time_elapsed) + " sec."
	get_node("./Health").value = get_tree().get_nodes_in_group("Player")[0].health
	get_node("./Coins/CoinsTxt").text = str(get_tree().get_nodes_in_group("Player")[0].coins)

	var x_current = $"../../Player/Camera2D2".get_screen_center_position().x;
	var x_final = $"../../Finish".position.x;
	var progress = (x_current - x_initial) / (x_final - x_initial) * 100;
	text = "[Progress: " + str(snapped(progress, 0)) + "%] ";
	
	var time_now = Time.get_unix_time_from_system()
	var time_elapsed = time_now - time_start
	text += "[Time elapsed: " + str(snapped(time_elapsed, 0)) + " seconds] "