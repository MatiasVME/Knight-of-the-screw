extends KinematicBody2D

var in_game = true

var direction = 1
var speed = 70
var jump_speed = 100
var gravity = 200

var velocity = Vector2()
var distance = Vector2()

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if in_game:
		_move(delta)

func _move(delta):
	distance.x = speed*delta
	velocity.x = (distance.x*direction)/delta
	velocity.y += gravity*delta 
	
	move_and_slide(velocity, Vector2(0,-1))
	
	if is_on_floor():
		velocity.y = 0
		
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump_speed