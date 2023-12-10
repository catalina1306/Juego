class_name Player
extends CharacterBody2D
@onready var hud = $CanvasLayer/hud
@onready var pivot = $pivot
var nb = 1

# holi
var speed = 300
var gravity = 1500
var jump_speed = -875
var extremidades_index = 0
var index = 1 :
	set(value) : 
		index = value 
		move_left = "move_left" + str(index)
		move_right = "move_right" + str(index)
		move_up = "move_up" + str(index)
		input_lanzar = "lanzar" + str(index)
		if hud :
			hud.index = index

var move_left
var move_right
var move_up
var input_lanzar

var idles = {
	4: "idle 5",
	3: "idle 4",
	2: "idle 3",
	1: "idle 2",
	0: "idle 1"
}

var jumps = {
	4: "jump 5",
	3: "jump 4",
	2: "jump 3",
	1: "jump 2",
	0: "jump 1"
}

var runs = {
	4: "run 5",
	3: "run 4",
	2: "run 3",
	1: "run 2",
	0: "run 1"
}


@onready var hombro = $pivot/hombro
@onready var _animated_sprite = $AnimatedSprite2D
@export var extremidades: Array[PackedScene]




var health = 100:
	set(value):
		health = value
		if hud:
			hud.set_health(health)

var maxHealth = 100

func _ready() -> void:
	hud.set_health(health)
	
func _process(delta: float) -> void:
	if health <= 0:
		game_over()
		
	var move_input = Input.get_action_strength(move_right) - Input.get_action_strength(move_left)

	if move_input > 0:
		_animated_sprite.play(runs[extremidades_index])
		_animated_sprite.flip_h = false
		pivot.scale.x = -1
	elif move_input < 0:
		_animated_sprite.play(runs[extremidades_index])
		_animated_sprite.flip_h = true
		pivot.scale.x = 1
	else:
		if is_on_floor():
			_animated_sprite.play(idles[extremidades_index])

		else:
			_animated_sprite.stop()
	
	
		
func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta

	var move_input = Input.get_action_strength(move_right) - Input.get_action_strength(move_left)

	if Input.is_action_just_pressed(input_lanzar) && extremidades_index<extremidades.size() :
		lanzar()
		

	# Handle Jump.
	if Input.is_action_just_pressed(move_up):
		if is_on_floor():
			_animated_sprite.play(jumps[extremidades_index])
			velocity.y = jump_speed

	if move_input != 0:
		velocity.x = move_input * speed
	else:
		velocity.x = 0

	move_and_slide()
	
# Agregar esta función para controlar el último frame de la animación de salto
func _on_AnimatedSprite2D_animation_finished():
	if _animated_sprite.animation == "jump 1" or "jump 2" or "jump 3" or "jump 4" or "jump 5":
		_animated_sprite.frame = _animated_sprite.frame_count - 1

func lanzar():
	var extremidad=extremidades[extremidades_index].instantiate()
	if not extremidad:
		return


	#extremidad.add_collision_exception_with(self)
	extremidad.global_position = hombro.global_position
	add_child(extremidad)
	extremidad.apply_central_impulse((Vector2.LEFT if _animated_sprite.flip_h else Vector2.RIGHT)*750)
	extremidades_index +=1
	var tween=create_tween()
	tween.tween_property(_animated_sprite, "modulate", Color(0, 1, 0), 0.2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.tween_property(_animated_sprite, "modulate", Color(1, 1, 1), 0.2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	

func take_damage(damage):
	if health > 0 :
		health = max(health-10*damage,0)
		var tween=create_tween()
		tween.tween_property(_animated_sprite, "skew", PI/3 *pivot.scale.x , 0.2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		tween.tween_property(_animated_sprite, "skew", 0, 0.2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		tween.tween_property(_animated_sprite, "modulate", Color(1, 0, 0), 0.2).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		tween.tween_property(_animated_sprite, "modulate", Color(1, 1, 1), 0.2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		

func game_over():
	mostrar_game_over_scene()
func mostrar_game_over_scene():
	get_tree().change_scene_to_file("res://Scenes/GameOverMenu.tscn")
