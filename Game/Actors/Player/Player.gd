extends KinematicBody2D

var in_game = true

var direction = 1
var speed = 70
var jump_speed = 200
var gravity = 200
var d_jump = 0

var velocity = Vector2()
var distance = Vector2()

func _ready():
	$Img.playing = true

func _physics_process(delta):
	if in_game:
		_move(delta)

func _move(delta):
	distance.x = speed*delta
	velocity.x = (distance.x*direction)/delta
	velocity.y += gravity*delta 
	
	move_and_slide(velocity, Vector2(0,-1))
	
	if Input.is_action_just_pressed("jump") and d_jump == 1:
		velocity.y = -jump_speed
		d_jump = 0
	
	if is_on_floor():
		velocity.y += 0
		
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
	