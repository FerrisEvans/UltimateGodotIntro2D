extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta: float) -> void:
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if can_laser && Input.is_action_pressed("primary action"):
		print("shoot laser")
		can_laser = false
		$LaserReloadTimer.start()

	if can_grenade and Input.is_action_pressed("secondary action"):
		print("shoot grenade")
		can_grenade = false
		$GrenadeReloadTimer.start(0.5)

func _on_timer_timeout() -> void:
	if not can_laser:
		can_laser = true
		print("can laser")

func _on_grenade_reload_timer_timeout() -> void:
	if not can_grenade:
		can_grenade = true
		print("can grenade")
