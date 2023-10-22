extends Control
@onready var fight = $VBoxContainer/Fight
@onready var back = $VBoxContainer2/back



func _ready() -> void:
	fight.pressed.connect(_on_fight_pressed)
	back.pressed.connect(_on_return_pressed)

func _on_fight_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

