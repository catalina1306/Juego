extends VBoxContainer

@onready var exit = $VBoxContainer/Exit
@onready var menu = %Menu
@onready var jugar = %"Jugar de nuevo"

func _ready() -> void:
	visible = false
	
	if menu != null:
		menu.pressed.connect(_on_menu_pressed)
	if jugar != null:
		jugar.pressed.connect(_on_jugar_pressed)
	if exit != null:
		exit.pressed.connect(_on_exit_pressed)

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused
		visible = true

func _on_menu_pressed():
	if menu != null:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_jugar_pressed():
	if jugar != null:
		get_tree().paused = false
		visible = false

func _on_exit_pressed():
	if exit != null:
		get_tree().quit()
