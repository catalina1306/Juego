extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D):
	if body.has_method("take_damage") and body != get_parent().get_parent():
		body.take_damage()
