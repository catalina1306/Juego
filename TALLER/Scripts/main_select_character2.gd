extends Control


@onready var back = $VBoxContainer2/back

### hay hacer dos escenas de selccion para el personaje 1 y para el personaje 2 y guardarlas en el global 


var default: String = "res://Scenes/personaje_2.tscn"
var ant: String = "res://Scenes/personaje_1.tscn" 


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
	global.character2 = default
	go_to_scene()
