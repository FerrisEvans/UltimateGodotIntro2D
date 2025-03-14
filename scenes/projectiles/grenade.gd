extends RigidBody2D

@export var speed: int
var explosion_active: bool = false
var explosion_radius: int = 300

func explode():
	$AnimationPlayer.play('Explosion')
	explosion_active = true

func _process(_delta: float) -> void:
	if explosion_active:
		for target in get_tree().get_nodes_in_group('Entities') + get_tree().get_nodes_in_group('Entities'):
			var in_range = target.global_position.distance_to(global_position)
			if 'hit' in target && in_range <= explosion_radius:
				target.hit()
