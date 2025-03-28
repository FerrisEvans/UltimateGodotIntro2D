extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload('res://scenes/items/item.tscn')

func _on_player_laser(pos, direction: Vector2) -> void:
	create_laser(pos, direction)


func _on_player_grenade(pos, direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)

func _on_container_open(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child', item)

func _on_scout_laser(pos: Vector2, direction: Vector2) -> void:
	create_laser(pos, direction)


func _ready() -> void:
	for container in get_tree().get_nodes_in_group('Container'):
		container.connect('open', _on_container_open)
	for scout in get_tree().get_nodes_in_group('Scouts'):
		scout.connect('laser', _on_scout_laser)


func create_laser(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	# 1. update the laser position
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle())
	
	# 2. we have to move the laser
	# 3. add the laser instance to a Node2D
	$Projectiles.add_child(laser)
	
