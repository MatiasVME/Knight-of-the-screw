extends Node2D

var rec_block = load("res://Game/Actors/Blocks/Brick.tscn")
var rec_background = load("res://Game/Backgrounds/background.tscn")

var blocks_floor_increment = 1
var blocks_roof_increment = 1

var player
var camera

var dead_ot = true
var levels_ot = [true, true, true, true, true]

func _ready():
	player = PlayerManager.player
	player.position = Vector2(600, 100)
	
	camera = Camera2D.new()
	camera.offset.x = 300
	camera.offset.y = -110
	camera.current = true
	camera.limit_top = 0
	camera.limit_smoothed = true
	camera.smoothing_enabled = true
	
	var ins_background = rec_background.instance()
	ins_background.layer = -1
	player.add_child(ins_background)
	
	player.add_child(camera)
	add_child(player)
	
	$EnemyObjectsCreator.set_player(player)
	
	MusicManager.select_music(2)
	MusicManager.play_music()
	
func _physics_process(delta):
	build_floor()
	build_roof()
	menu() # Verifica si muestra el menú o no
	detect_level() # Detecta a que nivel llega

func build_floor():
	if player == null:
		return
	
	if player.position.x + Main.RES_X * blocks_floor_increment:
		var ins_block = rec_block.instance()
		ins_block.position = Vector2(blocks_floor_increment * 64 * 1 + 1, Main.RES_Y - 32)
		add_child(ins_block)
		blocks_floor_increment += 1

func build_roof():
	if player == null:
		return
	
	if player.position.x + Main.RES_X * blocks_roof_increment:
		var ins_block = rec_block.instance()
		ins_block.position = Vector2(blocks_roof_increment * 64 * 1 + 1, 0)
		add_child(ins_block)
		blocks_roof_increment += 1
		
func menu():
	if Main.is_dead and dead_ot:
		$MenuLayer/Menu.disabled = false
		$Anim.play("show_menu_button")
		dead_ot = false

func detect_level():
	if levels_ot[0] and LevelManager.current_level == 1:
		$MenuLayer/LevelLabel.text = "Level " + str(LevelManager.current_level)
		$AnimLabel.play("show_label")
		levels_ot[0] = false
	elif levels_ot[1] and LevelManager.current_level == 2:
		$MenuLayer/LevelLabel.text = "Level " + str(LevelManager.current_level)
		$AnimLabel.play_backwards("show_label")
		levels_ot[1] = false
	elif levels_ot[2] and LevelManager.current_level == 3:
		$MenuLayer/LevelLabel.text = "Level " + str(LevelManager.current_level)
		$AnimLabel.play("show_label")
		levels_ot[2] = false
	elif levels_ot[3] and LevelManager.current_level == 4:
		$MenuLayer/LevelLabel.text = "Level " + str(LevelManager.current_level)
		$AnimLabel.play_backwards("show_label")
		levels_ot[3] = false
	elif levels_ot[4] and LevelManager.current_level == 5:
		$MenuLayer/LevelLabel.text = "Level " + str(LevelManager.current_level)
		$AnimLabel.play("show_label")
		levels_ot[4] = false

func _on_Menu_pressed():
	$MenuLayer/Menu.disabled = true
	$Anim.play_backwards("show_menu_button")

	player.reset_movement = true
	player.resurrect()
	dead_ot = true
	
	var i = 0
	while i < levels_ot.size():
		levels_ot[i] = true
		
		i += 1
		
	$EnemyObjectsCreator.can_spawn = true
	LevelManager.reset_levels()
	
func _on_SpeedChange_timeout():
	$MenuLayer/Speed.text = "Speed: " + str(int(player.linear_velocity.x))
