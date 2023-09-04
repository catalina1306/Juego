extends Control
@onready var start = %Start
@onready var exit = %Exit
@onready var credits = %Credits


func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	exit.pressed.connect(_on_exit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
	
