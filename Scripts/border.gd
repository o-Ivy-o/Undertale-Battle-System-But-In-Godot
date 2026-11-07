extends CanvasLayer

@onready var Borders : Array = get_children()

func _ready() -> void:
	Global.GlobalMaxBorder = get_child_count() -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for i in get_children():
		i.visible = false
	
	var selectedBorder = Borders.get(Global.border)
	selectedBorder.visible = true
	if selectedBorder.has_meta("BorderName"):
		Global.BorderName = selectedBorder.get_meta("BorderName")
