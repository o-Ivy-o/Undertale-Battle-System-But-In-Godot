extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$QuitText.visible = false
	
	match Input.is_action_pressed("Quit"):
			false:
				$QuitText.visible = false
				$AnimationPlayer.stop()
			true:
				$QuitText.visible = true
				$AnimationPlayer.play("Quit")
				await $AnimationPlayer.animation_finished
				get_tree().quit()
		
