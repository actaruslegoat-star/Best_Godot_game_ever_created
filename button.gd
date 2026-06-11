extends Button

@export var target: Node

func activate():
	if target and target.has_method("on_use"):
		target.on_use()
	print(target)
	print(target.has_method("on_use"))


func _on_pressed() -> void:
	activate()
