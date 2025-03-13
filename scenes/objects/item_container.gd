extends StaticBody2D
class_name ItemContainer

signal open(pos, direction)

# ready: applying rotation; creating the node
@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
var opened: bool = false

func hit() -> void:
	if not opened:
		$LidSprite.hide()
		var pos = $SpawnPositions/Marker2D.global_position
		open.emit(pos, current_direction)
		opened = true
