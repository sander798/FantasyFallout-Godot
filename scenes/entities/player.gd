extends CharacterBody2D

var walkSpeed: float = 200

func _process(delta: float) -> void:
	if !Global.isTimeStopped and !%Camera.isCameraFree:
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

func centre_camera() -> void:
	%Camera.position = self.position
	
func stop_animation() ->  void:
	$AnimatedSprite2D.stop()
