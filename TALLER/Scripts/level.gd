extends Node2D

@export var camera_max_zoom : float
@export var camera_min_zoom : float
@export var a = 7000
@onready var players = $players

@onready var personaje1 = load(global.character1).instantiate()
@onready var personaje2 = load(global.character2).instantiate()

@onready var camera = $Camera2D
@onready var pos_1 = $pos1
@onready var pos_2 = $pos2


func _ready():
	personaje1.global_position = pos_1.global_position
	personaje2.global_position = pos_2.global_position
	players.add_child(personaje1)
	players.add_child(personaje2)	

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



