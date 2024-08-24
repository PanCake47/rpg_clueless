extends CharacterBody2D


var max_hp = 100 
var current_hp = max_hp
var speed = 300
var target_position: Vector2 = Vector2.ZERO
var is_moving = false

@onready var player_gui: Control = $PlayerGUI

func _ready():
	player_gui.update_hp(current_hp, max_hp)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		target_position = get_global_mouse_position()
		is_moving = true

func _process(_delta: float):
	if is_moving:
		var direction = (target_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()

	if global_position.distance_to(target_position) < 5:
		is_moving = false
		velocity = Vector2.ZERO
		
	if Input.is_action_just_pressed("move_right"):
		take_damage(10)
		print(current_hp)
	if Input.is_action_just_pressed("move_left"):
		heal(10)
		print(current_hp)


func take_damage(amount):
	current_hp -= amount
	current_hp = clamp(current_hp, 0, max_hp)
	player_gui.update_hp(current_hp, max_hp)

func heal(amount):
	current_hp += amount
	current_hp = clamp(current_hp, 0, max_hp)
	player_gui.update_hp(current_hp, max_hp)
