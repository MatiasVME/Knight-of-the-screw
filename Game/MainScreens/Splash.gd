extends Node

func _ready():
	animate($Animar/ColorRect)
	
func _process(delta):
#	$ColorRect.color = Color(randf(), randf(), randf(), 0.8)
	pass
	
func animate(color_rect):
	var trans_rand = randi() % 11
	var ease_rand = randi() % 4
	var init_color = Color(randf(), randf(), randf(), randf())
	var finish_color = Color(randf(), randf(), randf(), randf())
	
	$Tween.interpolate_property(color_rect, "color", init_color, 
			finish_color, 3, trans_rand, ease_rand)
	$Tween.start()