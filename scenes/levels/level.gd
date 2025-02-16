extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body) -> void:
	print(body)

func _on_player_laser(pos, direction: Vector2) -> void:
	var laser = laser_scene.instantiate() as Area2D
	# 1. update the laser position
	laser.position = pos
	laser.direction = direction
	laser.rotate(direction.angle())
	
	# 2. we have to move the laser
	# 3. add the laser instance to a Node2D
	$Projectiles.add_child(laser)

func _on_player_grenade(pos, direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
