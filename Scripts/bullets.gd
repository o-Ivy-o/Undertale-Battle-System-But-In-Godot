extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		if i == Area2D:
			i.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
