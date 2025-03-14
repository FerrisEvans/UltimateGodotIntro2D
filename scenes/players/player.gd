extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction)

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed = max_speed

func _on_timer_timeout() -> void:
	if not can_laser:
		can_laser = true

func _on_grenade_reload_timer_timeout() -> void:
	if not can_grenade:
		can_grenade = true


func _process(_delta: float) -> void:
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position
	
	# rotate player
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	var player_direction = (mouse_position - position).normalized()
	
	# laser shooting input
	if can_laser && Globals.laser_amount > 0 && Input.is_action_pressed("primary action"):
		Globals.laser_amount -= 1
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		laser.emit(selected_laser.global_position, player_direction)
		
		$GPUParticles2D.emitting = true
		can_laser = false
		$LaserReloadTimer.start()

	if can_grenade and Globals.grenade_amount > 0 and Input.is_action_pressed("secondary action"):
		Globals.grenade_amount -= 1
		var grenade_markers = $GrenadeStartPosition.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]

		grenade.emit(selected_grenade.global_position, player_direction)
		can_grenade = false
		$GrenadeReloadTimer.start()
