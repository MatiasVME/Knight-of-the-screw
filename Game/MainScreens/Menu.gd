extends Node

func _ready():
	pass

func _on_Play_pressed():
	get_tree().change_scene("res://Game/Levels/Level1-v2.tscn")

func _on_Exit_pressed():
	get_tree().quit()
