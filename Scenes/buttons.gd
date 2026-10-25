extends Control

var buttonindex = 0
@onready var buttons : Array = get_children()
@onready var maxbuttonindex = buttons.size()-1
@export var canmoveindex = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in buttons:
		i.frame = 0
	
	if canmoveindex:
		var selectedbutton = buttons.get(buttonindex)
		selectedbutton.frame = 1
		$"../MSoul".position = Vector2(selectedbutton.position.x-20,selectedbutton.position.y)
		
		if Input.is_action_just_pressed("Right"):
			if buttonindex < maxbuttonindex:
				buttonindex += 1
				AudioHandler.snd_menumove.play()
		elif Input.is_action_just_pressed("Left"):
			if buttonindex > 0:
				buttonindex -= 1
				AudioHandler.snd_menumove.play()
