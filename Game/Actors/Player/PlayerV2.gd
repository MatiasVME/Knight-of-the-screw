extends RigidBody2D

func _ready():
	$Imagen.playing = true

func _physics_process(delta):
	if Main.is_dead:
		return
	
	self.apply_impulse(Vector2(0, 0), Vector2(0.6, 0))
	
	if Input.is_action_pressed("ui_right"):
		self.apply_impulse(Vector2(0, 0), Vector2(2, 0))
	if Input.is_action_pressed("ui_up"):
		self.apply_impulse(Vector2(0, 0), Vector2(0, -5))
	elif Input.is_action_pressed("ui_down"):
		self.apply_impulse(Vector2(0, 0), Vector2(0, 5))
	
	# Para testiar
	if Input.is_action_pressed("ui_accept"):
		$Imagen.scale.x += 0.3
		$Imagen.scale.y += 0.3
		$Collision.scale.x += 0.12
		$Collision.scale.y += 0.12
	
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
		Main.is_dead = true

func heal():
	if $Imagen.scale.x > 4 + 0.3 and not Main.is_dead:
		$Imagen.scale.x -= 0.6
		$Imagen.scale.y -= 0.6
		$Collision.scale.x -= 0.24
		$Collision.scale.y -= 0.24
		
		$Anim.play("heal")
		
func resurrect():
	$Imagen.global_scale.x = 4
	$Imagen.global_scale.y = 4
	$Collision.global_scale.x = 1
	$Collision.global_scale.y = 1
	Main.is_dead = false
	$Imagen.modulate = Color(1, 1, 1, 1)
	
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.queue_free()

func _on_ReduceSize_timeout():
	heal()