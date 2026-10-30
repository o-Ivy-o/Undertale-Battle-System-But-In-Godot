extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	battlemessag("* The battle starts..")
	for i in $BHellBox/Bullets.get_children():
		i.visible = false
	await get_tree().create_timer(.1).timeout
	AudioHandler.selectedBattleTheme.play()


func startbhell():
	$BHellBox/Text/LetterTimer.stop()
	$MSoul.hide()
	$Buttons.canmoveindex = false
	$BHellBox/BSoul.soulmode = 0
	for i in $BHellBox/Bullets.get_children():
		i.canhurt = true
	$BHellBox/BulletHellAnimationPlayer.play("Start")
	await $BHellBox/BulletHellAnimationPlayer.animation_finished
	$BHellBox/PatternAnimations.play("Test2")
	$BHellBox/BSoul.canmove = true
	await $BHellBox/PatternAnimations.animation_finished
	endbhell()

func endbhell():
	$BHellBox/BulletHellAnimationPlayer.play("End")
	$BHellBox/BSoul.canmove = false
	await  $BHellBox/BulletHellAnimationPlayer.animation_finished
	$MSoul.show()
	$Buttons.canmoveindex = true


func battlemessag(text):
	var label = $BHellBox/Text
	
	label.visible = true
	label.text = text
	label.visible_characters = 0
	$BHellBox/Text/LetterTimer.start()



func _on_letter_timer_timeout() -> void:
	var maxcharacters = $BHellBox/Text.get_total_character_count()
	
	if $BHellBox/Text.visible_characters < maxcharacters:
		$BHellBox/Text.visible_characters += 1
		AudioHandler.snd_txtnoe.play()
