extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_laser(pos, direction: Vector2) -> void:
	var laser = laser_scene.instantiate() as Area2D
	# 1. update the laser position
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle())
	
	# 2. we have to move the laser
	# 3. add the laser instance to a Node2D
	$UI.update_laser_text()
	$Projectiles.add_child(laser)


func _on_player_grenade(pos, direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$UI.update_grenade_text()
	$Projectiles.add_child(grenade)


func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', Vector2(1, 1), 1)


func _on_house_player_left() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, 'zoom', Vector2(0.6, 0.6), 1)
