# TODO: Quedan muchas cosas que hacer acá :P

extends Node2D

var rec_block = load("res://Game/Actors/Blocks/Brick.tscn")
var blocks_floor_increment = 1

var player
var camera

func _ready():
	player = PlayerManager.player
	player.position = Vector2(20, -100)
	
	camera = Camera2D.new()
	camera.offset.x = 400
	camera.offset.y = -100
	camera.current = true
	camera.limit_top = -50
	camera.limit_smoothed = true
	camera.smoothing_enabled = true
	
	player.add_child(camera)
	add_child(player)
	
func _physics_process(delta):
	build_floor()

func build_floor():
	if player.position.x + Main.RES_X * blocks_floor_increment:
		var ins_block = rec_block.instance()
		ins_block.position = Vector2(blocks_floor_increment * 64 * 1 + 1, Main.RES_Y - 32)
		add_child(ins_block)
		blocks_floor_increment += 1