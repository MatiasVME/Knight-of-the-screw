extends RigidBody2D

func _ready():
	$Imagen.playing = true

func _physics_process(delta):
	self.apply_impulse(Vector2(0, 0), Vector2(0.5, 0))
	
	if Input.is_action_pressed("ui_right"):
		self.apply_impulse(Vector2(0, 0), Vector2(1, 0))
	if Input.is_action_pressed("ui_up"):
		self.apply_impulse(Vector2(0, 0), Vector2(0, -5))
	elif Input.is_action_pressed("ui_down"):
		self.apply_impulse(Vector2(0, 0), Vector2(0, 5))

	for body in self.get_colliding_bodies():
		print("collision")
		if body.is_in_group("Enemies"):
			print("enemies!!!")
			self.apply_impulse(Vector2(0, 0), Vector2(rand_range(-500, 500), rand_range(-500, 500)))
