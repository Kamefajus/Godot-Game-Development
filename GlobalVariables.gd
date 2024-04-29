extends Node

var save_path = "user://global-variables.save"

var coins = 0
var armor = 0
var booster = 0
var engine = 0
var fuel = 0
var gun = 0
var weight = 0

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(coins)
	file.store_var(armor)
	file.store_var(booster)
	file.store_var(engine)
	file.store_var(fuel)
	file.store_var(gun)
	file.store_var(weight)
	file.close()

func load():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		coins = file.get_var(coins)
		armor = file.get_var(armor)
		booster = file.get_var(booster)
		engine = file.get_var(engine)
		fuel = file.get_var(fuel)
		gun = file.get_var(gun)
		weight = file.get_var(weight)

func reset():
	coins = 0	
	armor = 0
	booster = 0
	engine = 0
	fuel = 0
	gun = 0
	weight = 0
	save()

