extends Control

func _ready():
	get_node("./Coins").text = str(GlobalVariables.coins)
	get_node("./Armor/ProgressBar").value = GlobalVariables.armor
	get_node("./Booster/ProgressBar").value = GlobalVariables.booster
	get_node("./Engine/ProgressBar").value = GlobalVariables.engine
	get_node("./Fuel/ProgressBar").value = GlobalVariables.fuel
	get_node("./Gun/ProgressBar").value = GlobalVariables.gun
	get_node("./Weight/ProgressBar").value = GlobalVariables.weight

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func maybe_upgrade(current_value):
	if (GlobalVariables.coins >= ((current_value + 1) * 10) && current_value < 100):
		GlobalVariables.coins -= (current_value + 1) * 10
		return current_value + 1
	else:
		return current_value

func _on_upgrade_armor_button_pressed():
	GlobalVariables.armor = maybe_upgrade(GlobalVariables.armor)
	get_tree().reload_current_scene()

func _on_upgrade_booster_button_pressed():
	GlobalVariables.booster = maybe_upgrade(GlobalVariables.booster)
	get_tree().reload_current_scene()

func _on_upgrade_engine_button_pressed():
	GlobalVariables.engine = maybe_upgrade(GlobalVariables.engine)
	get_tree().reload_current_scene()

func _on_upgrade_fuel_button_pressed():
	GlobalVariables.fuel = maybe_upgrade(GlobalVariables.fuel)
	get_tree().reload_current_scene()

func _on_upgrade_gun_button_pressed():
	GlobalVariables.gun = maybe_upgrade(GlobalVariables.gun)
	get_tree().reload_current_scene()

func _on_upgrade_weight_button_pressed():
	GlobalVariables.weight = maybe_upgrade(GlobalVariables.weight)
	get_tree().reload_current_scene()
