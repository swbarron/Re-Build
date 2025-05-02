extends CharacterBody2D


const SPEED = 50

func cartesian_to_isometric():
	pass

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("jump"):
		print("boobs")
	elif Input.is_action_pressed("down"):
		self.velocity = Vector2(-1.0, 0.5) * SPEED
		print(self.velocity)
	if Input.is_action_pressed("up"):
		self.velocity = Vector2(1.0, -0.5) * SPEED
		print(self.velocity)
	elif Input.is_action_pressed("right"):
		self.velocity = Vector2(1.0, 0.5) * SPEED
		print(self.velocity)
	if Input.is_action_pressed("left"):
		self.velocity = Vector2(-1.0, -0.5) * SPEED
		print(self.velocity)
	elif not Input.is_anything_pressed():
		self.velocity = Vector2.ZERO
		
	




	move_and_slide()
