
extends CharacterBody2D

@onready var Player_node: CharacterBody2D = get_parent().get_node("Player")

var speed:float = 400
var should_chase: bool = false

func _physics_process(delta: float) -> void:
	if should_chase:
		var direction = (Player_node.global_position-global_position).normalized()
		velocity = lerp(velocity, direction * speed, 8.5*delta)
		move_and_slide()
		if direction.x > 0:
			$sprite2D.flip_h = false
		if direction.x < 0:
			$sprite2D.flip_h = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == Player_node:
		get_tree().call_deferred("reload_current_scene")


func _on_enter_area_body_entered(body: Node2D) -> void:
	if body == Player_node:
		should_chase = true


func _on_exit_area_body_exited(body: Node2D) -> void:
	if body == Player_node:
		should_chase = false
