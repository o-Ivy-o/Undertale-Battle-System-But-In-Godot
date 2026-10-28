extends CharacterBody2D

@export var hp = 20
var Soulspeed = 60
var invincible = false
@export var soulmode : int    #0 = red #1 = blue
@export var canmove : bool = false


func _process(delta: float) -> void:
	match soulmode:
		0: #red
			$Soul.animation = "Red"
			var dir = Input.get_vector("Left","Right","Up","Down",)
			match Input.is_action_pressed("Back"):
				false:
					Soulspeed = 60
				true:
					Soulspeed = 30
			if dir and canmove:
				velocity = dir*Soulspeed
			else:
				velocity = Vector2(0,0)
		1: #blue
			var dir = Input.get_axis("Left","Right")
			$Soul.animation = "Blue"
			if not is_on_floor():
				velocity.y += 150 * delta
			if Input.is_action_just_pressed("Up") and is_on_floor() and canmove:
				velocity.y = -50
			if dir and canmove:
				velocity.x = dir*Soulspeed
			else:
				velocity.x = 0
	move_and_slide()


func _on_test_bullet_hit(body,b) -> void:
	if body == self and invincible != true:
		AudioHandler.snd_hurt_1.play()
		invincible = true
		hp -= 4
		$InvincTimer.start()
		$Soul.play()
		print("hit")
		b.visible = false
		b.canhurt = false
		if hp <= 0:
			
			AudioHandler.selectedBattleTheme.stop()
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func _on_invinc_timer_timeout() -> void:
	print("invincover")
	invincible = false
	$Soul.stop()
	$InvincTimer.stop()
