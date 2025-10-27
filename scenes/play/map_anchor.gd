extends Node2D

var currentMap: Node = null

func _ready() -> void:
	load_map("res://scenes/maps/test_map.tscn")

func load_map(mapPath: String) -> void:
	if currentMap != null:
		remove_child(currentMap)
	
	currentMap = load(mapPath).instantiate()
	add_child(currentMap)
	
	%Player.position = Vector2(128, 128)
	%Player.centre_camera()
