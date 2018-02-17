extends Node2D

var mov = false

func _ready():
	$tiles2.global_position.x = $tiles2.global_position.x + 36*16
func _on_Area2D_body_exited(body):
	if mov == false:
		$tiles2.global_position.x = $tiles.global_position.x + 36*16
		mov = true
	else:
		$tiles.global_position.x = $tiles2.global_position.x+36*16
		mov = false