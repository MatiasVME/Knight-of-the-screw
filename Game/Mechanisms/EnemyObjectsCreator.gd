extends Node2D

var rec_object = load("res://Game/Actors/Enemies/EnemyObject.tscn")

var can_spawn = false

func _ready():
	randomize()
	
func _physics_process(delta):
	if can_spawn:
		spawn_object()
		can_spawn = false
		
func spawn_object():
	var pos_x = Main.RES_X
	var pos_y = rand_range(100, 200)
	
	var ins_object = rec_object.instance()
	ins_object.position = Vector2(pos_x, pos_y)
	add_child(ins_object)
	ins_object.apply_impulse(Vector2(0, 0),
			Vector2(rand_range(-100, -200), rand_range(-30, -100)))
	ins_object.angular_velocity = rand_range(-50, 50)
	ins_object.bounce = randf()

func _on_Timer_timeout():
	can_spawn = true
	print("hola")
