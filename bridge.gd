extends AnimatableBody2D

var is_open:bool = true
	
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_use():
	is_open = not is_open
	if not is_open:
		$AnimationPlayer.play("Bidge_90_degree_turn") # $ = récupere l'animateur ( animation player pour lui )
	else:
		$AnimationPlayer.play_backwards("Bidge_90_degree_turn")
	print("heloo")
