extends KinematicBody2D

var is_game = true

var direction = 0
var speed = 50
var jump_speed = 100
var gravity = 60

var velocity = Vector2()
var distance = Vector2()

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	pass