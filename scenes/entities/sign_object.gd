extends StaticBody2D

@export var label: String = "sign"

@export_multiline var text: String = "Hello World!"

func _mouse_enter() -> void:
	Global.currentTarget = self
	
func _mouse_exit() -> void:
	if Global.currentTarget == self:
		Global.currentTarget = null

func interact() -> void:
	var labelArray: Array[String] = [label]
	var textArray: Array[String] = [text]
	get_node("/root/Play/%DialoguePanel").startDialogue(labelArray, textArray)
