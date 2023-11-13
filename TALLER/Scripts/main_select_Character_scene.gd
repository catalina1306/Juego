extends Control
@onready var fight = $VBoxContainer/Fight
@onready var back = $VBoxContainer2/back
var castle: String = "res://Scenes/castle2.tscn"
var city: String = "res://Scenes/city.tscn"



func _ready() -> void:
	back.pressed.connect(_on_return_pressed)
	
func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
func go_to_scene():
	get_tree().change_scene_to_file(global.scene_dir)

func _on_texture_button_pressed(): 
	global.scene_dir = castle
	go_to_scene()


func _on_texture_button_2_pressed():
	global.scene_dir = city
	go_to_scene()
