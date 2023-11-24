extends Area2D

var on_flor = false 


func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D):
	if body.has_method("take_damage") and body != get_parent().get_parent():
		body.take_damage()
		
	if body is TileMap : 
		on_flor = true 
	if on_flor and body == get_parent().get_parent():
		body.brazos_count += 1 
		get_parent().queue_free()
		
	
