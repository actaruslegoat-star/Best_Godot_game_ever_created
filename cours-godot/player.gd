extends CharacterBody2D

@export var speed: float = 500

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1
	
	velocity = direction.normalized() * speed
	move_and_slide()
