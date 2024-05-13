extends Control

var not_enough_coins = false

func _ready():
	get_node("./Coins").text = str(GlobalVariables.coins)
	get_node("./Armor/ProgressBar").value = GlobalVariables.armor
	get_node("./Booster/ProgressBar").value = GlobalVariables.booster
	get_node("./Engine/ProgressBar").value = GlobalVariables.engine
	get_node("./Fuel/ProgressBar").value = GlobalVariables.fuel
	get_node("./Gun/ProgressBar").value = GlobalVariables.gun
	get_node("./Weight/ProgressBar").value = GlobalVariables.weight

func _on_button_pressed():
	GlobalVariables.save()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func maybe_upgrade(current_value):
	if (GlobalVariables.coins >= ((current_value + 1) * 10) && current_value < 100):
		GlobalVariables.coins -= (current_value + 1) * 10
		not_enough_coins = false
		return current_value + 1
	else:
		not_enough_coins = true
		$NotEnoughCoins/Label.text = "You do not have the necessary amount of\n"
		$NotEnoughCoins/Label.text += "coins to buy this upgrade! ("
		$NotEnoughCoins/Label.text += str((current_value + 1) * 10)
		$NotEnoughCoins/Label.text += " is required)"
		return current_value
 
func _on_upgrade_armor_button_pressed():
	GlobalVariables.armor = maybe_upgrade(GlobalVariables.armor)
	if (not_enough_coins):
		$NotEnoughCoins.show()
	else:
		get_tree().reload_current_scene()

func _on_upgrade_booster_button_pressed():
	GlobalVariables.booster = maybe_upgrade(GlobalVariables.booster)
	if (not_enough_coins):
		$NotEnoughCoins.show()
	else:
		get_tree().reload_current_scene()

func _on_upgrade_engine_button_pressed():
	GlobalVariables.engine = maybe_upgrade(GlobalVariables.engine)
	if (not_enough_coins):
		$NotEnoughCoins.show()
	else:
		get_tree().reload_current_scene()

func _on_upgrade_fuel_button_pressed():
	GlobalVariables.fuel = maybe_upgrade(GlobalVariables.fuel)
	if (not_enough_coins):
		$NotEnoughCoins.show()
	else:
		get_tree().reload_current_scene()

func _on_upgrade_gun_button_pressed():
	GlobalVariables.gun = maybe_upgrade(GlobalVariables.gun)
	if (not_enough_coins):
		$NotEnoughCoins.show()
	else:
		get_tree().reload_current_scene()

func _on_upgrade_weight_button_pressed():
	GlobalVariables.weight = maybe_upgrade(GlobalVariables.weight)
	if (not_enough_coins):
		$NotEnoughCoins.show()
	else:
		get_tree().reload_current_scene()

func _on_not_enough_coins_close_requested():
	$NotEnoughCoins.hide()

func _on_upgrade_armor_button_mouse_entered():
	$PriceLabel.text = str((GlobalVariables.armor + 1) * 10) + "¢"
	$PriceLabel.position = get_viewport().get_mouse_position() + Vector2(70, 10)
	$PriceLabel.show()

func _on_upgrade_armor_button_mouse_exited():
	$PriceLabel.hide()

func _on_upgrade_booster_button_mouse_entered():
	$PriceLabel.text = str((GlobalVariables.booster + 1) * 10) + "¢"
	$PriceLabel.position = get_viewport().get_mouse_position() + Vector2(70, 10)
	$PriceLabel.show()

func _on_upgrade_booster_button_mouse_exited():
	$PriceLabel.hide()


func _on_upgrade_engine_button_mouse_entered():
	$PriceLabel.text = str((GlobalVariables.engine + 1) * 10) + "¢"
	$PriceLabel.position = get_viewport().get_mouse_position() + Vector2(70, 10)
	$PriceLabel.show()

func _on_upgrade_engine_button_mouse_exited():
	$PriceLabel.hide()

func _on_upgrade_fuel_button_mouse_entered():
	$PriceLabel.text = str((GlobalVariables.fuel + 1) * 10) + "¢"
	$PriceLabel.position = get_viewport().get_mouse_position() + Vector2(70, 10)
	$PriceLabel.show()

func _on_upgrade_fuel_button_mouse_exited():
	$PriceLabel.hide()

func _on_upgrade_gun_button_mouse_entered():
	$PriceLabel.text = str((GlobalVariables.gun + 1) * 10) + "¢"
	$PriceLabel.position = get_viewport().get_mouse_position() + Vector2(70, 10)
	$PriceLabel.show()

func _on_upgrade_gun_button_mouse_exited():
	$PriceLabel.hide()

func _on_upgrade_weight_button_mouse_entered():
	$PriceLabel.text = str((GlobalVariables.weight + 1) * 10) + "¢"
	$PriceLabel.position = get_viewport().get_mouse_position() + Vector2(70, 10)
	$PriceLabel.show()

func _on_upgrade_weight_button_mouse_exited():
	$PriceLabel.hide()
