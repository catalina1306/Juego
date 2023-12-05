extends Control


@onready var back = $VBoxContainer2/back


var ant: String = "res://Scenes/player_1.tscn"
var honguito: String = "res://Scenes/player_3.tscn"
var goblin: String = "res://Scenes/player_4.tscn"

func _ready() -> void:
	back.pressed.connect(_on_return_pressed)
	
func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_select_character1.tscn")
	
func go_to_scene():
	get_tree().change_scene_to_file("res://Scenes/main_select_scene.tscn")

func _on_antb_pressed():
	global.character2 = ant
	go_to_scene()


func _on_defaultb_pressed():
	global.character2 = honguito
	go_to_scene()
	
func _on_goblin_pressed():
	global.character1 = goblin
	go_to_scene() 
