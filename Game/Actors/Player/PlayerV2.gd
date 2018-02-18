extends RigidBody2D

var is_dead = true

func _ready():
	$Imagen.playing = true

func _physics_process(delta):
	if not is_dead:
		return
	
	self.apply_impulse(Vector2(0, 0), Vector2(0.6, 0))
	
	if Input.is_action_pressed("ui_right"):
		self.apply_impulse(Vector2(0, 0), Vector2(1, 0))
	if Input.is_action_pressed("ui_up"):
		self.apply_impulse(Vector2(0, 0), Vector2(0, -5))
	elif Input.is_action_pressed("ui_down"):
		self.apply_impulse(Vector2(0, 0), Vector2(0, 5))
	
	hit() # Ve se choca con algo
	dead() # Ve si puede morir

func hit():
	for body in self.get_colliding_bodies():
		if body.is_in_group("Enemies"):
			self.apply_impulse(Vector2(0, 0), Vector2(rand_range(-250, 250), rand_range(-250, 250)))
			$Imagen.scale.x += 0.3
			$Imagen.scale.y += 0.3
			$Collision.scale.x += 0.12
			$Collision.scale.y += 0.12
			
			$Anim.play("hit")
			
func dead():
	if $Imagen.scale.x > 13 and not $Anim.is_playing():
		$Anim.play("dead")
		is_dead = false
	
	# arreglar esto mañana
#	if $Anim.assigned_animation == "dead" and not $Anim.is_playing():
#		queue_free()

func _on_ReduceSize_timeout():
	if $Imagen.scale.x > 4 + 0.3:
		$Imagen.scale.x -= 0.6
		$Imagen.scale.y -= 0.6
		$Collision.scale.x -= 0.24
		$Collision.scale.y -= 0.24
		
		$Anim.play("heal")
	
	print("time")
