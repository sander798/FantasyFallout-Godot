extends CharacterBody2D

var walkSpeed: float = 200
var interactionRange: float = 150

func _process(delta: float) -> void:
	if !Global.isTimeStopped and !%Camera.isCameraFree:
		# Player movement
		var xDelta = Input.get_axis("player_left", "player_right") * walkSpeed * delta
		var yDelta = Input.get_axis("player_up", "player_down") * walkSpeed * delta
		self.position += Vector2(xDelta, yDelta)
		%Camera.position += Vector2(xDelta, yDelta)
		
		if xDelta < 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play()
		elif xDelta > 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play()
		elif yDelta != 0:
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
			
		if Input.is_action_just_pressed("player_interact"):
			if Global.currentTarget != null:
				# Check if target is in range
				if Global.currentTarget.global_position.distance_to(self.global_position) < interactionRange:
					Global.currentTarget.interact()

func centre_camera() -> void:
	%Camera.position = self.position
	
func stop_animation() ->  void:
	$AnimatedSprite2D.stop()
