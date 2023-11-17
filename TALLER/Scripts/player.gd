class_name Player
extends CharacterBody2D
@onready var hud = $CanvasLayer/hud

var speed = 300
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_speed = -750
var brazos_count = 4
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
	4: "idle 1",
	3: "idle 2",
	2: "idle 3",
	1: "idle 4",
	0: "idle 5"
}

var jumps = {
	4: "jump 1",
	3: "jump 2",
	2: "jump 3",
	1: "jump 4",
	0: "jump 5"
}

var runs = {
	4: "jump 1",
	3: "jump 2",
	2: "jump 3",
	1: "jump 4",
	0: "jump 5"
}



@onready var hombro = $hombro
@onready var _animated_sprite = $AnimatedSprite2D
@export var brazo_morado = preload("res://Scenes/brazo_morado.tscn")

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
		_animated_sprite.play(runs[brazos_count])
		_animated_sprite.flip_h = false
	elif move_input < 0:
		_animated_sprite.play(runs[brazos_count])
		_animated_sprite.flip_h = true
	else:
		if is_on_floor():
			_animated_sprite.play(idles[brazos_count])

		else:
			_animated_sprite.stop()
		#_animated_sprite.flip_h = false (poner si se quiere que siempre mire a la derecha)
	
		
func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta

	var move_input = Input.get_action_strength(move_right) - Input.get_action_strength(move_left)

	if Input.is_action_just_pressed(input_lanzar) && brazos_count >0:
		lanzar()
		_animated_sprite.play("lanzar")
		brazos_count -=1

	# Handle Jump.
	if Input.is_action_just_pressed(move_up):
		if is_on_floor():
			_animated_sprite.play(jumps[brazos_count])
			velocity.y = jump_speed

	if move_input != 0:
		velocity.x = move_input * speed
	else:
		velocity.x = 0

	move_and_slide()
	
# Agregar esta función para controlar el último frame de la animación de salto
func _on_AnimatedSprite2D_animation_finished():
	if _animated_sprite.animation == "jump 1" or "jump 2" or "jump 3" or "jump 4" or "jump 5" or "lanzar":
		_animated_sprite.frame = _animated_sprite.frame_count - 1

func lanzar():
	if not brazo_morado:
		return

	if brazos_count > 0:
		var extremidad = brazo_morado.instantiate() as RigidBody2D
		extremidad.add_collision_exception_with(self)
		add_child(extremidad)
		extremidad.global_position = hombro.global_position
		extremidad.apply_central_impulse((Vector2.LEFT if _animated_sprite.flip_h else Vector2.RIGHT)*750)

func take_damage():
	if health > 0 :
		health = max(health-10,0)
		
func game_over():
	mostrar_game_over_scene()
func mostrar_game_over_scene():
	get_tree().change_scene_to_file("res://Scenes/GameOverMenu.tscn")
