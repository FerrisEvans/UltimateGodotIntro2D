extends CharacterBody2D

signal laser(pos, direction)

var player_nearby: bool = false
var can_laser: bool = true
var is_hitted: bool = false
var health = 30

func _process(_delta: float) -> void:
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var pos: Vector2 = $LaserSpawnPositions.get_children()[randi() % $LaserSpawnPositions.get_child_count()].global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$LaserCoolDown.start()

func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_cool_down_timeout() -> void:
	can_laser = true

func _on_hit_interval_timeout() -> void:
	is_hitted = false
	$Scout.material.set_shader_parameter('progress', 0)

func hit():
	if not is_hitted && $HitInterval.is_stopped():
		health -= Globals.laser_dmg
		$HitInterval.start()
		is_hitted = true
		$Scout.material.set_shader_parameter('progress', 1)
	if health <= 0:
		queue_free()
