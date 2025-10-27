extends Camera2D

@export var cameraSpeed: int = 1000

var isCameraFree: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.get_action_strength("player_free_camera") == 1:
		var xDelta = Input.get_axis("player_left", "player_right") * cameraSpeed * delta
		var yDelta = Input.get_axis("player_up", "player_down") * cameraSpeed * delta
		self.position += Vector2(xDelta, yDelta)
		
		isCameraFree = true
		%Player.stop_animation()
	elif isCameraFree:
		isCameraFree = false
		%Player.centre_camera()
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
	
	# Pause time
	if Input.is_action_just_pressed("player_time_toggle"):
		Global.isTimeStopped = !Global.isTimeStopped
