# TODO: Quedan muchas cosas que hacer acá :P

extends Node2D

var rec_block = load("res://Game/Actors/Blocks/Brick.tscn")
#var rec_enemy_object = load("res://Game/Actors/Enemies/EnemyObject.tscn")

var blocks_floor_increment = 1
var blocks_roof_increment = 1

var player
var camera

func _ready():
	player = PlayerManager.player
	player.position = Vector2(600, 100)
	
	camera = Camera2D.new()
	camera.offset.x = 400
	camera.offset.y = -70
	camera.current = true
	camera.limit_top = 0
	camera.limit_smoothed = true
	camera.smoothing_enabled = true
	
#	var ins_enemy_objects = rec_enemy_object.instance()
#	ins_enemy_objects.global_position.x = camera.global_position.x
	
#	camera.add_child(ins_enemy_objects)

	player.add_child(camera)
	add_child(player)
	
	$EnemyObjectsCreator.set_player(player)
	
func _physics_process(delta):
	build_floor()
	build_roof()
	
#	$EnemyObjectsCreator.global_position.x = player.global_position.x + 100
#	$EnemyObjectsCreator.global_position.y = 100

func build_floor():
	if player.position.x + Main.RES_X * blocks_floor_increment:
		var ins_block = rec_block.instance()
		ins_block.position = Vector2(blocks_floor_increment * 64 * 1 + 1, Main.RES_Y - 32)
		add_child(ins_block)
		blocks_floor_increment += 1

func build_roof():
	if player.position.x + Main.RES_X * blocks_roof_increment:
		var ins_block = rec_block.instance()
		ins_block.position = Vector2(blocks_roof_increment * 64 * 1 + 1, 0)
		add_child(ins_block)
		blocks_roof_increment += 1