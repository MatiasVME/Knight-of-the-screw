extends Node

onready var robot_title = $RobotTitle
onready var megaman = $Megaman

enum Music {ROBOT_TITLE = 1, MEGAMAN}
var current_music = null

func select_music(p_music):
	if current_music != null:
		current_music.stop()
	
	match p_music:
		Music.ROBOT_TITLE :
			current_music = robot_title
		Music.MEGAMAN :
			current_music = megaman
		
func play_music():
	if current_music != null:
		current_music.play()
		
func stop_music():
	if current_music != null:
		current_music.stop()