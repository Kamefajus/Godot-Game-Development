extends Node

var save_path = "user://global-variables.save"

var coins = 0
var armor = 0
var booster = 0
var engine = 0
var fuel = 0
var gun = 0
var weight = 0
var levels_unlocked = 1

var current_level = 0 # Šito į failą išsaugoti nereikia.

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(InputMap.action_get_events("move_right")[0], true)
	file.store_var(InputMap.action_get_events("move_left")[0], true)
	file.store_var(InputMap.action_get_events("shoot")[0], true)
	file.store_var(coins)
	file.store_var(armor)
	file.store_var(booster)
	file.store_var(engine)
	file.store_var(fuel)
	file.store_var(gun)
	file.store_var(weight)
	file.store_var(levels_unlocked)
	file.store_var(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	file.store_var(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	file.store_var(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sfx")))
	file.store_var(AudioServer.is_bus_mute(AudioServer.get_bus_index("Music")))
	file.close()

func load():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		InputMap.action_erase_events("move_right")
		InputMap.action_add_event("move_right", file.get_var(true))
		InputMap.action_erase_events("move_left")
		InputMap.action_add_event("move_left", file.get_var(true))
		InputMap.action_erase_events("shoot")
		InputMap.action_add_event("shoot", file.get_var(true))
		coins = file.get_var()
		armor = file.get_var()
		booster = file.get_var()
		engine = file.get_var()
		fuel = file.get_var()
		gun = file.get_var()
		weight = file.get_var()
		levels_unlocked = file.get_var()
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), file.get_var())
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), file.get_var())
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), file.get_var())
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), file.get_var())

func reset():
	InputMap.load_from_project_settings()
	coins = 0	
	armor = 0
	booster = 0
	engine = 0
	fuel = 0
	gun = 0
	weight = 0
	levels_unlocked = 1
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), 100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), 100)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
	save()

