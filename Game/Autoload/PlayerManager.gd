extends Node

var rec_player = load("res://Game/Actors/Player/PlayerV2.tscn")
var player = null

func _ready():
	create_player()
	
func create_player():
	player = rec_player.instance()
