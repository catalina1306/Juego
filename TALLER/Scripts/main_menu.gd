extends Control
@onready var start = %Start
@onready var exit = %Exit
@onready var credits = $VBoxContainer/Credits
@onready var tutorial = $VBoxContainer/Tutorial



func _ready() -> void:
	global.playMenuMusic()
	start.pressed.connect(_on_start_pressed)
	exit.pressed.connect(_on_exit_pressed)
	credits.pressed.connect(_on_credits_pressed)
	tutorial.pressed.connect(_on_tutorial_pressed)
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_select_character1.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
	
func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
