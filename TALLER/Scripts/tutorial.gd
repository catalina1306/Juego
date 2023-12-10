extends Node2D


@onready var personaje1 = load(global.character1).instantiate()
@onready var personaje2 = load(global.character2).instantiate()
@onready var pos_1 = $pos1
@onready var pos_2 = $pos2
@onready var players = $players
@export var scene: String


func _ready():
	global.playFightMusic()
	personaje1.global_position = pos_1.global_position
	personaje2.global_position = pos_2.global_position
	players.add_child(personaje1)
	players.add_child(personaje2)
	personaje1.index = 1
	personaje2.index = 2
	global.scene_dir=scene

