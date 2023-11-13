extends Control
@onready var exit = $VBoxContainer/Exit
@onready var menu = %Menu
@onready var jugar = %"Jugar de nuevo"

func _ready() -> void:

	if menu != null:
		menu.pressed.connect(_on_menu_pressed)
	if jugar != null:
		jugar.pressed.connect(_on_jugar_pressed)
	if exit != null:
		exit.pressed.connect(_on_exit_pressed)

func _on_menu_pressed():
	if menu != null:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_jugar_pressed():
	if jugar != null:
		get_tree().change_scene_to_file(global.scene_dir)

func _on_exit_pressed():
	if exit != null:
		get_tree().quit()
