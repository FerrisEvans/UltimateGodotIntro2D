extends CharacterBody2D

var active: bool = false
var vulnerable: bool = true
var health: int = 50
@export var speed: int = 400


func _ready() -> void:
	$Drone.show()

func _process(delta: float):
	if active:
		look_at(Globals.player_pos)
		velocity = (Globals.player_pos - position).normalized() * speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			$AnimationPlayer.play('explosion')

func stop_movement() -> void:
	active = false

func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$HitTimer.start()
		$Drone.material.set_shader_parameter('progress', 1)
	if health <= 0:
		$AnimationPlayer.play('explosion')


func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true

func _on_hit_timer_timeout() -> void:
	vulnerable = true
	$Drone.material.set_shader_parameter('progress', 0)
