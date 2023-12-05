extends Area2D

var on_flor = false

@export var damage= 1


func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D):
	if body.has_method("take_damage") and body != get_parent().get_parent():
		body.take_damage(damage)
		
	if body is TileMap or body is RigidBody2D: 
		on_flor = true 
	if on_flor and body == get_parent().get_parent():
		body.extremidades_index -= 1 
		get_parent().queue_free()
		
	
