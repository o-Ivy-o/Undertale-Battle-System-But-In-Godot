extends Area2D

signal hit
@export var canhurt = true

func _on_body_entered(body: Node2D,bullet = self) -> void:
	if canhurt:
		hit.emit(body,bullet)
