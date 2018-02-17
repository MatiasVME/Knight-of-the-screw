# TODO: Quedan muchas cosas que hacer acá :P

extends Node2D

var rec_block = load("res://Game/Actors/Blocks/Brick.tscn")
var blocks_floor_increment = 1

var player

func _ready():
	player = PlayerManager.player
	player.position = Vector2(20, -100)
	
func _process(delta):
	build_floor()

func build_floor():
	if $Player.position.x + Main.RES_X * blocks_floor_increment:
		ins_block = rec_block.instance()
		ins_block.position = Vector2(blocks_floor_increment * 64 * 1 + 1, Main.RES_Y)
		add_child(ins_block)
		blocks_floor_increment += 1