extends Node

signal stat_change

var player_pos: Vector2
var player_vulneralbe: bool = true

var laser_amount: int = 20:
	set(value):
		laser_amount = value
		stat_change.emit()

var grenade_amount: int = 5:
	set(value):
		grenade_amount = value
		stat_change.emit()

var health: int = 60:
	set(value):
		if value > health:
			health = min(value, 100)
			return
		if player_vulneralbe:
			health = value
			player_vulneralbe = false
			player_invulnerable_timer()
			stat_change.emit()


func player_invulnerable_timer():
	await get_tree().create_timer(0.5).timeout
	player_vulneralbe = true

var laser_dmg: int = 10
