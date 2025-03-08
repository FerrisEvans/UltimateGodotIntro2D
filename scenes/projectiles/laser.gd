extends Area2D

@export var speed: int
var direction: Vector2

func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	queue_free()
