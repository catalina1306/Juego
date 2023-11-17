extends Control
@onready var back = $VBoxContainer2/back
var castle: String = "res://Scenes/castle2.tscn"
var city: String = "res://Scenes/city.tscn"



func _ready() -> void:
	back.pressed.connect(_on_return_pressed)
	
func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_select_character.tscn")
	
func go_to_scene():
	get_tree().change_scene_to_file(global.scene_dir)

func _on_texture_button_pressed(): 
	global.scene_dir = castle
	get_tree().change_scene_to_file("res://Scenes/castle2.tscn")


func _on_texture_button_2_pressed():
	global.scene_dir = city
	get_tree().change_scene_to_file("res://Scenes/city.tscn")
