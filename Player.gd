extends KinematicBody2D

var RUN_SPEED = 300
var JUMP_SPEED = -1000
var GRAVITY = 1800
var GLIDE_SPEED = 100
var velocity = Vector2()
var has_axe = false
var has_climbing_gear = false
var has_kite = false
var is_gliding = false

func _ready():
	reset()

func reset():
	has_axe = false
	has_climbing_gear = false
	has_kite = false
	is_gliding = false

func get_input():
	velocity.x = 0
	if Input.is_action_pressed('right'):
		velocity.x += RUN_SPEED
	if Input.is_action_pressed('left'):
		velocity.x -= RUN_SPEED
	if Input.is_action_pressed('jump'):
		if has_kite and velocity.y > 0 and not (is_on_floor() or is_on_wall() or is_on_ceiling()):
			is_gliding = true
		elif is_on_floor() or (has_climbing_gear and is_on_wall()):
			velocity.y = JUMP_SPEED

func _physics_process(delta):
	
	get_input()

	velocity.y += delta * GRAVITY
	if is_gliding:
		velocity.y = min(velocity.y, GLIDE_SPEED)
	
	if velocity.x > 0:
		$Sprite.flip_h = false
	elif velocity.x < 0:
		$Sprite.flip_h = true
		
	if velocity.x == 0:
		$Sprite.animation = "standing"
	else:
		$Sprite.animation = "walking"
	
	velocity = move_and_slide(velocity, Vector2(0,-1))
	if position.y > 3200:
		position.y = -3180
	elif position.y < -3200:
		position.y = 3180
	
	is_gliding = false
