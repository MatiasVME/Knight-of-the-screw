extends RigidBody2D

func _on_VisibilityEnabler2D_screen_exited():
	queue_free()
