extends CharacterBody2D

func _process(_delta: float):
	# direction
	var direction = Vector2.RIGHT
	# velocity
	velocity = direction * 200
	# move and slide
	move_and_slide()
