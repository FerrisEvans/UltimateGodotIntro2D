extends Area2D

@export var rotation_speed: int = 4
var available_options: Array[String] = ['laser', 'grenade', 'health']
var type = available_options[randi() % len(available_options)]

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready() -> void:	
	var color: Color = Color(1, 1, 1)
	if type == 'laser':
		color = Color(0.1, 0.2, 0.8)
	if type == 'grenade':
		color = Color(0.8, 0.2, 0.1)
	if type == 'health':
		color = Color(0.1, 0.8, 0.2)
	$Orb2.modulate = color
	# tween
	var target_pos = position + direction * distance
	var movement_tween = create_tween()
	movement_tween.tween_property(self, 'position', target_pos, 0.5)


func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	if type == 'laser':
		Globals.laser_amount += 5
		queue_free()
	if type == 'grenade':
		Globals.grenade_amount += 1
		queue_free()
	if type == 'health':
		Globals.health += 10
		queue_free()
