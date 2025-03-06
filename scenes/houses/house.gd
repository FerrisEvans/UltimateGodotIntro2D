extends Area2D

signal player_entered
signal player_left

func _on_body_entered(_body: Node2D) -> void:
	emit_signal('player_entered')

func _on_body_exited(_body: Node2D) -> void:
	emit_signal('player_left')
