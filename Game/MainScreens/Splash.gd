extends Node

func _ready():
	MusicManager.select_music(1)
	MusicManager.play_music()
	animate($Animar/ColorRect)
	
func animate(color_rect):
	var trans_rand = randi() % 11
	var ease_rand = randi() % 4
	var init_color = Color(randf(), randf(), randf(), randf())
	var finish_color = Color(randf(), randf(), randf(), randf())
	
	$Tween.interpolate_property(color_rect, "color", init_color, 
			finish_color, 3, trans_rand, ease_rand)
	$Tween.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://Game/MainScreens/Menu.tscn")
