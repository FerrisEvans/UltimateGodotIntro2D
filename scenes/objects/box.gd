extends ItemContainer

func hit() -> void:
	if not opened:
		$LidSprite.hide()
		for i in range(5):
			var pos = $SpawnPositions/Marker2D.global_position
			open.emit(pos, current_direction)
		opened = true
