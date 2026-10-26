extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(.1).timeout
	AudioHandler.selectedBattleTheme.play()
	startbhell()


func startbhell():
	battlemessag("* The battle starts..")
	await get_tree().create_timer(3).timeout
	$BHellBox/BulletHellAnimationPlayer.play("Start")
	$BHellBox/BSoul.canmove = true
	$Buttons.canmoveindex = false
	await get_tree().create_timer(5).timeout
	endbhell()

func endbhell():
	$BHellBox/BulletHellAnimationPlayer.play("End")
	$BHellBox/BSoul.canmove = false
	await  $BHellBox/BulletHellAnimationPlayer.animation_finished
	battlemessag("* its now turn 2!")
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
