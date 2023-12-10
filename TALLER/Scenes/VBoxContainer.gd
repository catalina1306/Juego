extends VBoxContainer

var speed = Vector2(0, 150)  # Velocidad del texto (ajusta según tus necesidades)
@onready var back = $"../back"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back.pressed.connect(_on_return_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= speed * delta


func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
