extends VBoxContainer

var speed = Vector2(100, 0)  # Velocidad del texto (ajusta según tus necesidades)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * delta
