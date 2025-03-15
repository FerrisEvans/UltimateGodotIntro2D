extends CharacterBody2D

@export var speed: int = 200
var player_nearby: bool = false
var can_hit_player: bool = false
var is_hit: bool = false
var health = 50


func hit() -> void:
	print(health)
	if not is_hit && $HitInterval.is_stopped():
		health -= Globals.laser_dmg
		$HitInterval.start()
		is_hit = true
		$Bug.material.set_shader_parameter('progress', 1)
	if health <= 0:
		queue_free()


func _process(_delta: float) -> void:
	if player_nearby:
		look_at(Globals.player_pos)
		var direction: Vector2 = (Globals.player_pos - position).normalized()
		# velocity
		velocity = direction * speed
		# move and slide
		move_and_slide()
		if can_hit_player:
			Globals.health -= Globals.bug_dmg
			await get_tree().create_timer(1).timeout


func _on_notice_area_body_entered(_body: Node2D) -> void:
	player_nearby = true
	$Bug.play('walk')

func _on_notice_area_body_exited(_body: Node2D) -> void:
	player_nearby = false
	$Bug.stop()

func _on_hit_interval_timeout() -> void:
	is_hit = false
	$Bug.material.set_shader_parameter('progress', 0)


func _on_attack_area_body_entered(_body: Node2D) -> void:
	$Bug.play('attack')
	can_hit_player = true



func _on_attack_area_body_exited(_body: Node2D) -> void:
	can_hit_player = false
	$Bug.play('walk')
