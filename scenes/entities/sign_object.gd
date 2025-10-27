extends StaticBody2D

@export var label = "sign"

@export_multiline var text = "Hello World!"

func _mouse_enter() -> void:
	Global.currentTarget = self
	
func _mouse_exit() -> void:
	if Global.currentTarget == self:
		Global.currentTarget = null

func interact() -> void:
	print(text)
