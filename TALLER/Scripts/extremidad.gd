extends RigidBody2D

var speed = 1000


@onready var _animated_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)
	top_level = true

func _physics_process(delta: float) -> void:
	pass
func _on_body_entered(body: Node2D):
	_animated_sprite.play("tirado")
	queue_free()
