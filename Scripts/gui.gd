extends CanvasLayer

var x_initial = 0
var time_start = 0
var time_now = 0

var fuel_capacity = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	x_initial = $"../Player/Camera2D2".get_screen_center_position().x;
	fuel_capacity = $"../Player".fuel_capacity
	time_start = Time.get_unix_time_from_system()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_now = Time.get_unix_time_from_system()
	var time_elapsed = snapped(time_now - time_start, 0.01)
  
	get_node("./Timer2/TimerTxt").text = str(time_elapsed) + " sec."
	get_node("./Health").value = get_tree().get_nodes_in_group("Player")[0].health
	get_node("./Coins/CoinsTxt").text = str(get_tree().get_nodes_in_group("Player")[0].coins)

	var x_current = $"../Player/Camera2D2".get_screen_center_position().x;
	var x_final = $"../Finish".position.x;
	var progress = (x_current - x_initial) / (x_final - x_initial) * 100;
	
	var fuel_level = $"../Player".fuel_level
	
	get_node("./Progress").value = progress
	get_node("./Fuel").value = fuel_level / fuel_capacity * 100
	
	get_node("./bullets").max_value = GlobalVariables.gun * 10
	get_node("./bullets").value = $"../Player/Gun".bullets
	get_node("./bullets/Label2").text = str($"../Player/Gun".bullets) + " / " + str(GlobalVariables.gun * 10)
