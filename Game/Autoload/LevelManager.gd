extends Node

var current_level = 1
var player

var levels_ot = [true, true, true, true, true]

func _ready():
	player = PlayerManager.player

func _physics_process(delta):
	if levels_ot[4] and player.position.x >= 24000:
		current_level = 5
		levels_ot[4] = false
	elif levels_ot[3] and player.position.x >= 18000:
		current_level = 4
		levels_ot[3] = false
	elif levels_ot[2] and player.position.x >= 12000:
		current_level = 3
		levels_ot[2] = false
	elif levels_ot[1] and player.position.x >= 2000:
		current_level = 2
		levels_ot[1] = false
	elif levels_ot[0] and player.position.x <= 2000:
		current_level = 1
		levels_ot[0] = false
	
func reset_levels():
	current_level = 1
	
	var i = 0
	while i < levels_ot.size():
		levels_ot[i] = true
		
		i += 1