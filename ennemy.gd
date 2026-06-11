"""
ennemie roule a droite
si ennemie ne peut plus rouler a droite
	inverser la direction
si ennemie ne peut plus rouler a gauche
	inverser la direction
"""

extends CharacterBody2D

var direction = 1
var start_position = 0
var walking_distance = 150
var speed = 200

func _process(delta: float) -> void:
	if direction == -1:
		$Sprite2D.rotation_degrees -= delta * speed
	if direction == 1:
		$Sprite2D.rotation_degrees += delta * speed


func _ready():
	start_position = position.x

func _physics_process(delta):
	position.x += direction * speed * delta
	
	if (position.x >= start_position + walking_distance):
		direction = -1

	if (position.x <= start_position - walking_distance):
		direction = 1

		



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.global_position = Vector2(0,0)
		print(body)
	
