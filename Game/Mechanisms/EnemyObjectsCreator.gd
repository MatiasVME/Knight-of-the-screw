extends Node2D

var rec_object = load("res://Game/Actors/Enemies/EnemyObject.tscn")

export (int) var wait_time = 3

var player setget set_player
var can_spawn = false

func _ready():
	randomize()
	$Timer.wait_time = wait_time
	
func _physics_process(delta):
	if can_spawn:
		if LevelManager.current_level == 1:
			pass
		elif LevelManager.current_level == 2:
			spawn_object()
			can_spawn = false
		elif LevelManager.current_level == 3:
			spawn_object()
			spawn_object()
			can_spawn = false
		elif LevelManager.current_level == 4:
			spawn_object()
			spawn_object()
			spawn_object()
			can_spawn = false
		elif LevelManager.current_level == 5:
			spawn_object()
			spawn_object()
			spawn_object()
			spawn_object()
			can_spawn = false
		
func spawn_object():
	var pos_x = Main.RES_X + player.position.x
	var pos_y = rand_range(100, 400)
	
	var ins_object = rec_object.instance()
	ins_object.position = Vector2(pos_x, pos_y)
	get_parent().add_child(ins_object)
	ins_object.apply_impulse(Vector2(0, 0),
			Vector2(rand_range(-100, -250), rand_range(-30, -100)))
	ins_object.angular_velocity = rand_range(-50, 50)
	ins_object.bounce = randf()

func set_player(_player):
	player = _player

func _on_Timer_timeout():
	if player != null:
		can_spawn = true
