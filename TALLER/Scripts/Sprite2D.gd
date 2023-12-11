extends CanvasLayer

@export var texto: String = "":
	set(value):
		texto=value
		$Timer.start()
		
var index = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if index >= texto.length():
		$Timer.stop()
	else:
		$Label.text = $Label.text + texto[index]
		index +=1
