extends Area2D

@export var rotation_speed: int = 4
var available_options: Array[String] = ['laser', 'grenade', 'health']
var type = available_options[randi() % len(available_options)]

func _ready() -> void:
	var color: Color
	if type == 'laser':
		color = Color(0.1, 0.2, 0.8)
	if type == 'grenade':
		color = Color(0.8, 0.2, 0.1)
	if type == 'health':
		color = Color(0.1, 0.8, 0.2)
	
	$Orb2.modulate = color

func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(body: Node2D) -> void:
	#if body.has_method('add_item'):
	if 'add_item' in body:
		body.add_item(type)
		queue_free()
