extends Node2D

@export var camera_max_zoom : float
@export var camera_min_zoom : float
@export var a = 7000
@onready var players = $players

@onready var personaje1 = preload("res://Scenes/personaje_1.tscn").instantiate()
@onready var personaje2 = preload("res://Scenes/personaje_2.tscn").instantiate()

@onready var camera = $Camera2D

func _physics_process(delta):
	var pos := Vector2.ZERO as Vector2
	for player in players.get_children():
		pos += player.global_position

	pos /= players.get_child_count()
	camera.global_position = pos
	var max_dis= 0
	for player in players.get_children():
		max_dis = max(max_dis, pos.distance_squared_to(player.global_position))
	var zoom = clamp(1 / max_dis * a, camera_min_zoom, camera_max_zoom)
	camera.zoom = Vector2(zoom, zoom)

func _process(delta):
	# Verifica si uno de los jugadores ha perdido todas sus vidas
	if personaje1.health <= 0 or personaje2.health <= 0:
		get_tree().change_scene_to_file("res://GameOverMenu.gd")



