extends CharacterBody2D
class_name Player
"""
rajouter vie
se prendre dégats
"""
@export var speed: float = 500
@export var jump_force: float = -600
@export var gravity: float = 1500
var target_angle:float = 0

func _physics_process(delta: float) -> void:
	$Sprite2D.rotation_degrees += (target_angle - $Sprite2D.rotation_degrees) / 10
	

	if not is_on_floor():
		velocity.y += gravity * delta
 	
	if Input.is_key_pressed(KEY_D):
		velocity.x = speed
	elif Input.is_key_pressed(KEY_Q):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = jump_force
		print(velocity.x,":", target_angle)
		if velocity.x > 0:
			target_angle += 90
	
		elif velocity.x < 0:
			target_angle += -90
			
	for i in get_slide_collision_count():
		var col = get_slide_collision(i)
		var collider = col.get_collider()
		if collider is RigidBody2D:
			collider.apply_central_impulse(-col.get_normal() * 200)
	
	move_and_slide()
