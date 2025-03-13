extends LevelParent


func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property($Player, 'speed', 0, 1)
	# get_tree().change_scene_to_file('res://scenes/levels/inside.tscn')
	# get_tree().call_deferred('change_scene_to_file', 'res://scenes/levels/inside.tscn')
	TransitionLayer.change_scene('res://scenes/levels/inside.tscn')

func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', Vector2(1, 1), 1)


func _on_house_player_left() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', Vector2(0.6, 0.6), 1)
