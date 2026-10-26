extends CharacterBody2D

var Soulspeed = 60
@export var canmove : bool = false


func _process(delta: float) -> void:
	var dir = Input.get_vector("Left","Right","Up","Down",)
	
	match Input.is_action_pressed("Back"):
		false:
			Soulspeed = 60
		true:
			Soulspeed = 30
	
	if dir:
		velocity = dir*Soulspeed
	else:
		velocity = Vector2(0,0)
	
	move_and_slide()
