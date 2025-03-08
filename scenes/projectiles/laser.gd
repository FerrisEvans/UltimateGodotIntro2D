extends Area2D

@export var speed: int
var direction: Vector2

func _process(delta: float) -> void:
	position += direction * speed * delta

func _ready():
	$SelfDestroyTimer.start()



func _on_body_entered(body: Node2D) -> void:
	if 'hit' in body:
		body.hit()
	queue_free()



func _on_self_destroy_timer_timeout() -> void:
	queue_free()
