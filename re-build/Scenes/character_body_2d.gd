extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

@export var SPEED: float = 30.0



func _physics_process(_delta: float) -> void:
	
	# Get the input direction and add the speed 
	# if there's no speed, set the velocity to zero
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if direction:
		self.velocity = direction * SPEED
		#print(self.velocity)
	else:
		self.velocity = Vector2.ZERO
	

	move_and_slide()
	
