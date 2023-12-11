extends Node2D
@onready var players = $players

@onready var personaje1 = load(global.character1).instantiate()
@onready var personaje2 = load(global.character2).instantiate()

@onready var pos_1 = $pos1
@onready var pos_2 = $pos2
@export var scene: String
@onready var skip = $Sprite2D/Skip



func _ready():
	global.playFightMusic()
	skip.pressed.connect(_on_skip_pressed)
	personaje1.global_position = pos_1.global_position
	personaje2.global_position = pos_2.global_position
	players.add_child(personaje1)
	players.add_child(personaje2)
	personaje1.index = 1
	personaje2.index = 2
	global.scene_dir=scene

func _on_skip_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_select_character1.tscn")
	
