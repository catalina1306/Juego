extends Control

var menu
var jugar
var exit

func _ready() -> void:
	menu = $VBoxContainer/Menu
	jugar = $VBoxContainer/Jugar_de_nuevo
	exit = $VBoxContainer/Exit

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
		get_tree().change_scene_to_file("res://Scenes/main_select_Character_scene.tscn")

func _on_exit_pressed():
	if exit != null:
		get_tree().quit()
